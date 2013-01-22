<?php
$DB = new PDO("mysql:host=127.0.0.1;port=3306;dbname=subaru", '<user>', '<pass>');
$DOM = new DOMDocument('1.0', 'UTF-8');
$DOM->preserveWhiteSpace = false;
$DOM->formatOutput = true;

$fetch_scaling = function($parameterId, $typeId) use ($DB, $DOM) {

	// Setup Scale
	$stmtScale = $DB->prepare("
		SELECT
			S.Units,
			S.StorageType,
			SE.Expression,
			SE.Format,
			PS.MinValue,
			PS.MaxValue,
			PS.Increment
		FROM
			Parameter_Scale PS
			JOIN Scale S ON (S.ScaleID = PS.ScaleID)
			JOIN ScaleExpression SE ON (SE.ExpressionID = S.ExpressionID)
		WHERE
			PS.ParameterID = :ParameterID
			AND PS.TypeID = :TypeID
	");
	$stmtScale->execute(array(
		'ParameterID' => $parameterId,
		'TypeID' => $typeId
	));
	$stmtScale->setFetchMode(PDO::FETCH_CLASS, 'stdClass');

	// If we don't have a conversion, return false
	if(!$stmtScale->rowCount()) return false;

	// Otherwise build out our nodes
	$ConversionsNode = $DOM->createElement('conversions');

	while($Scale = $stmtScale->fetch()) {

		$ScaleNode = $DOM->createElement('conversion');
		$ScaleNode->setAttribute('units', $Scale->Units);
		if($Scale->StorageType)
			$ScaleNode->setAttribute('storagetype', $Scale->StorageType);
		$ScaleNode->setAttribute('expr', $Scale->Expression);
		$ScaleNode->setAttribute('format', sprintf($Scale->Format, 0));
		if($Scale->MinValue)
			$ScaleNode->setAttribute('gauge_min', (float)$Scale->MinValue);
		if($Scale->MaxValue)
			$ScaleNode->setAttribute('gauge_max', (float)$Scale->MaxValue);
		if($Scale->Increment)
			$ScaleNode->setAttribute('gauge_step', (float)$Scale->Increment);
		$ConversionsNode->appendChild($ScaleNode);

	}

	return $ConversionsNode;

};

$loggerTemplate = <<<EOD
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE logger SYSTEM "logger.dtd">
<!--ROMRAIDER LOGGER DEFINITION FILE

TERMS, CONDITIONS, AND DISCLAIMERS
- - - - - - - - - - - - - - - - - - - - - - - - -
WARNING: These definition files are created as the result of the extremely complex and time consuming process
of reverse-engineering the factory ECU. Because of this complexity, it is necessary to make certain assumptions
and, therefore, it is impossible to always deal in absolutes in regards to representations made by these
definitions. In addition, due to this complexity and the numerous variations among different ECUs, it is also
impossible to guarantee that the definitions will not contain errors or other bugs. What this all means is that
there is the potential for bugs, errors and misrepresentations which can result in damage to your motor, your
ECU as well the possibility of causing your vehicle to behave unexpectedly on the road, increasing the risk of
death or injury. Modifications to your vehicle's ECU may also be in violation of local, state and federal laws.
By using these definition files, either directly or indirectly, you agree to assume 100% of all risk and
RomRaider's creators and contributors shall not be held responsible for any damages or injuries you receive.
This product is for advanced users only. There are no safeguards in place when tuning with RomRaider. As such,
the potential for serious damage and injury still exists, even if the user does not experience any bugs or errors.
As always, use at your own risk.

These definitions are created for FREE without any sort of guarantee. The developers cannot be held liable for
any damage or injury incurred as a result of these definitions. USE AT YOUR OWN RISK! -->
<logger>
	<protocols>
		<protocol id="SSM" baud="4800" databits="8" stopbits="1" parity="0" connect_timeout="2000" send_timeout="55">
			<parameters />
			<switches />
			<ecuparams />
		</protocol>
	</protocols>
</logger>
EOD;

$DOM->loadXML($loggerTemplate);

// Fetch Standard Parameters
$stmt = $DB->prepare("
	SELECT
		P.ParameterID,
		P.TypeID,
		PT.Prefix,
		P.Name,
		P.Description,
		P.ByteIndex,
		P.OffsetBit,
		P.Target,
		A.Address,
		A.Length
	FROM
		Parameter P
		JOIN ParameterType PT ON (PT.TypeID = P.TypeID)
		LEFT JOIN Parameter_Address PA ON (PA.ParameterID = P.ParameterID AND PA.TypeID = P.TypeID)
		LEFT JOIN Address A ON (A.AddressID = PA.AddressID)
	WHERE
		P.TypeID = 1
	ORDER BY
		P.ParameterID
");
$stmt->execute();
$stmt->setFetchMode(PDO::FETCH_CLASS, 'stdClass');

$ParametersNode = $DOM->getElementsByTagName('parameters')->item(0);
while($Parameter = $stmt->fetch()) {

	// Create our Parameter Element 
	$ParameterNode = $DOM->createElement('parameter');

	// Populate standard attributes
	$ParameterNode->setAttribute('id', $Parameter->Prefix.$Parameter->ParameterID);
	$ParameterNode->setAttribute('name', $Parameter->Name);
	$ParameterNode->setAttribute('desc', $Parameter->Description);
	if(!is_null($Parameter->ByteIndex))
		$ParameterNode->setAttribute('ecubyteindex', $Parameter->ByteIndex);
	if(!is_null($Parameter->OffsetBit))
		$ParameterNode->setAttribute('ecubit', $Parameter->OffsetBit);
	$ParameterNode->setAttribute('target', $Parameter->Target);

	// Setup address or dependant parameters
	if($Parameter->Address) {

		// If we have an address, we know it is not a calculated parameter		
		$AddressNode = $DOM->createElement('address', '0x'.$Parameter->Address);

		// If our length is > 1 - set it on our node
		if($Parameter->Length > 1) {
			$AddressNode->setAttribute('length', $Parameter->Length);
		}

		$ParameterNode->appendChild($AddressNode);

	} else {

		// We have a dependant node - fetch our dependancies
		$DependsNode = $DOM->createElement('depends');

		$stmtDepends = $DB->prepare("
			SELECT
				CONCAT(PT.Prefix, PR.DependantID) AS ReferenceID
			FROM
				ParameterReference PR
				JOIN ParameterType PT ON (PT.TypeID = PR.DependantTypeID)
			WHERE
				PR.ParameterID = :ParameterID
				AND PR.ParameterTypeID = :TypeID
		");
		$stmtDepends->execute(array(
			'ParameterID' => $Parameter->ParameterID,
			'TypeID' => $Parameter->TypeID
		));
		$stmtDepends->setFetchMode(PDO::FETCH_CLASS, 'stdClass');

		while($Reference = $stmtDepends->fetch()) {

			// Create our reference elements and append it to the depends node
			$ReferenceNode = $DOM->createElement('ref');
			$ReferenceNode->setAttribute('parameter', $Reference->ReferenceID);
			$DependsNode->appendChild($ReferenceNode);

		}

		$ParameterNode->appendChild($DependsNode);

	}

	$ConversionsNode = $fetch_scaling($Parameter->ParameterID, $Parameter->TypeID);
	if($ConversionsNode) {
		$ParameterNode->appendChild($ConversionsNode);
	}

	$ParametersNode->appendChild($ParameterNode);

}

// Fetch Switches
$stmt = $DB->prepare("
	SELECT
		P.ParameterID,
		P.TypeID,
		PT.Prefix,
		P.Name,
		P.Description,
		P.ByteIndex,
		P.OffsetBit,
		P.Target,
		A.Address,
		A.Length
	FROM
		Parameter P
		JOIN ParameterType PT ON (PT.TypeID = P.TypeID)
		JOIN Parameter_Address PA ON (PA.ParameterID = P.ParameterID AND PA.TypeID = P.TypeID)
		JOIN Address A ON (A.AddressID = PA.AddressID)
	WHERE
		P.TypeID = 2
	ORDER BY
		P.ParameterID
");
$stmt->execute();
$stmt->setFetchMode(PDO::FETCH_CLASS, 'stdClass');

$SwitchesNode = $DOM->getElementsByTagName('switches')->item(0);
while($Switch = $stmt->fetch()) {

	// Create our Parameter Element 
	$SwitchNode = $DOM->createElement('switch');

	// Populate standard attributes
	$SwitchNode->setAttribute('id', $Switch->Prefix.$Switch->ParameterID);
	$SwitchNode->setAttribute('name', $Switch->Name);
	$SwitchNode->setAttribute('desc', $Switch->Description);
	$SwitchNode->setAttribute('byte', '0x'.$Switch->Address);
	$SwitchNode->setAttribute('bit', $Switch->OffsetBit);
	if(!is_null($Switch->ByteIndex))
		$SwitchNode->setAttribute('ecubyteindex', $Switch->ByteIndex);
	$SwitchNode->setAttribute('target', $Switch->Target);

	$SwitchesNode->appendChild($SwitchNode);

}

// Fetch ECU Parameters
$stmt = $DB->prepare("
	SELECT
		P.ParameterID,
		P.TypeID,
		PT.Prefix,
		P.Name,
		P.Description,
		P.Target
	FROM
		Parameter P
		JOIN ParameterType PT ON (PT.TypeID = P.TypeID)
	WHERE
		P.TypeID = 3
	ORDER BY
		P.ParameterID
");
$stmt->execute();
$stmt->setFetchMode(PDO::FETCH_CLASS, 'stdClass');

$ECUParametersNode = $DOM->getElementsByTagName('ecuparams')->item(0);
while($Parameter = $stmt->fetch()) {

	// Create our Parameter Element 
	$ECUParameterNode = $DOM->createElement('ecuparam');

	// Populate standard attributes
	$ECUParameterNode->setAttribute('id', $Parameter->Prefix.$Parameter->ParameterID);
	$ECUParameterNode->setAttribute('name', $Parameter->Name);
	$ECUParameterNode->setAttribute('desc', $Parameter->Description);
	$ECUParameterNode->setAttribute('target', $Parameter->Target);

	// Fetch our Addresses
	$stmtAddress = $DB->prepare("
		SELECT
			PA.ECUID,
			A.Address,
			A.Length
		FROM
			Parameter_Address PA
			JOIN Address A ON (PA.AddressID = A.AddressID)
		WHERE
			PA.ParameterID = :ParameterID
			AND PA.TypeID = :TypeID
	");
	$stmtAddress->execute(array(
		'ParameterID' => $Parameter->ParameterID,
		'TypeID' => $Parameter->TypeID
	));
	$stmtAddress->setFetchMode(PDO::FETCH_CLASS, 'stdClass');

	while($ECUAddress = $stmtAddress->fetch()) {

		$ECUNode = $DOM->createElement('ecu');
		$ECUNode->setAttribute('id', $ECUAddress->ECUID);
		$ECUAddressNode = $DOM->createElement('address', '0x'.$ECUAddress->Address);
		if($ECUAddress->Length > 1)
			$ECUAddressNode->setAttribute('length', $ECUAddress->Length);
		$ECUNode->appendChild($ECUAddressNode);
		$ECUParameterNode->appendChild($ECUNode);

	}

	$ConversionsNode = $fetch_scaling($Parameter->ParameterID, $Parameter->TypeID);
	if($ConversionsNode) {
		$ECUParameterNode->appendChild($ConversionsNode);
	}

	$ECUParametersNode->appendChild($ECUParameterNode);

}

//echo $DOM->saveXML();
echo preg_replace_callback('/^( +)</m', function($a) { 
  return str_repeat(' ',intval(strlen($a[1]) / 2) * 4).'<';  
}, $DOM->saveXML());
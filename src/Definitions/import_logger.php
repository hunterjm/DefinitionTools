<?php
abstract class PDOModel {

	protected $_DB;
	protected $_cleanData;

	public function __construct(PDO $DB) {
		$this->_DB = $DB;
		$this->set_clean_data();
	}

	public static function fetch_by_id($id, PDO $DB) {

		$params = array_combine((array)static::get_id_column(), (array)$id);
		return self::fetch_one_where($params, $DB);

	}

	public static function fetch_where($params, PDO $DB) {
		
		$table = get_called_class();
		$bind = array();

		$query = "SELECT * FROM $table WHERE";
		foreach($params as $column => $value) {
			$bind[":$column"] = $value;
			if(is_null($value)) {
				$query .= " :$column IS NULL AND";
			} else {
				$query .= " $column = :$column AND";
			}
		}
		$query = substr($query, 0, -4);

		$stmt = $DB->prepare($query);
		$stmt->execute($bind);
		$stmt->setFetchMode(PDO::FETCH_CLASS, $table, array($DB));

		if($stmt->rowCount()) {
			$Result = $stmt->fetchAll();
			foreach((array)$Result as $Object) {
				$Object->set_clean_data();
			}
			return $Result;
		}

		return false;

	}

	public static function fetch_one_where($params, PDO $DB) {
		$resultArray = self::fetch_where($params, $DB);
		if(!empty($resultArray)) {
			return current($resultArray);
		}
		return false;
	}

	public function set_clean_data() {
		$this->_cleanData = $this->_get_current_values();
	}

	public function save() {

		$idColumn = static::get_id_column();
		$table = get_class($this);

		$autoInc = false;
		if(!is_array($idColumn)) {
			$idColumn = (array)$idColumn;
			$autoInc = true;
		}

		$changedValues = array_diff_assoc($this->_get_current_values(), $this->_cleanData);

		// Make sure we actually made changes
		if(count($changedValues)) {

			if(!count(array_diff_key(array_flip($idColumn), $changedValues)) && array_filter($this->_cleanData)) {
				throw new Exception('Cannot change the ID column');
			}

			$bind = array();

			if(!$autoInc || empty($this->$idColumn[0])) {

				if(!$autoInc) {
					// Make sure all the keys are there
					$changedValues = $changedValues + array_combine($idColumn, array_fill(0, count($idColumn), null));
				}

				// Insert
				$bindString = rtrim(':' . implode(",:", array_keys($changedValues)), ',:');
				$bind = array_combine(explode(",", $bindString), array_values($changedValues));
				$query = "INSERT INTO $table (" . implode(",", array_keys($changedValues)) . ") VALUES ($bindString)";

				$stmt = $this->_DB->prepare($query);
				$res = $stmt->execute($bind);

				if($res) {
					if($autoInc) {
						$this->$idColumn[0] = $this->_DB->lastInsertID();
					}
					$this->set_clean_data();
				} else {
					print_r($this);
					print_r($stmt->errorInfo());
				}

				return $res;


			} else {

				// Update
				$query = "UPDATE $table SET";
				foreach($changedValues as $column => $value) {
					$query .= " $column = :$column,";
					$bind[":$column"] = $value;
				}
				$query = rtrim($query, ',');
				$query .= " WHERE";
				foreach($idColumn as $column) {
					$query .= " $column = :$column AND";
					$bind[":$column"] = $this->$column;
				}
				$query = substr($query, 0, -4);

				$stmt = $this->_DB->prepare($query);
				$res = $stmt->execute($bind);

				if($res) {
					$this->set_clean_data();
				} else {
					print_r($this);
					print_r($stmt->errorInfo());
				}

				return $res;

			}

		}

	}

	public function delete() {

		$idColumn = self::get_id_column();
		$table = get_class($this);

		$stmt = $this->_DB->prepare("DELETE FROM $table WHERE $idColumn = :id");
		$stmt->bindParam(':id', $this->$idColumn);
		$res = $stmt->execute();

		if($res) {
			$this->$idColumn = null;
			array_walk($this->_cleanData, function(&$value) {
				$value = null;
			});
		}

		return $res;

	}

	protected function _get_current_values() {
		$f = function($Object) {
			return get_object_vars($Object);
		};
		return $f($this);
	}

	abstract public static function get_id_column();

}

class ECU extends PDOModel {

	public $ID;
	public $CALID;
	public $ECUID;
	public $InternalIDAddress;
	public $InternalIDString;
	public $Year;
	public $Market;
	public $Make;
	public $Model;
	public $Submodel;
	public $Transmission;
	public $MemModel;
	public $FlashMethod;
	public $FileSize;
	public $ChecksumModule;

	public static function get_id_column() {
		return 'ID';
	}

}

class Parameter extends PDOModel {

	public $ParameterID;
	public $TypeID;
	public $Name;
	public $Description;
	public $ByteIndex;
	public $OffsetBit;
	public $Target;

	public static function get_id_column() {
		return array('ParameterID', 'TypeID');
	}

}

class ParameterReference extends PDOModel {

	public $ParameterID;
	public $ParameterTypeID;
	public $DependantID;
	public $DependantTypeID;

	public static function get_id_column() {
		return array('ParameterID', 'ParameterTypeID', 'DependantID', 'DependantTypeID');
	}

}

class Parameter_Address extends PDOModel {

	public $ParameterAddressID;
	public $ParameterID;
	public $TypeID;
	public $ECUID;
	public $AddressID;

	public static function get_id_column() {
		return 'ParameterAddressID';
	}
}

class Parameter_Scale extends PDOModel {

	public $ParameterID;
	public $TypeID;
	public $ScaleID;
	public $MinValue;
	public $MaxValue;
	public $Increment;

	public static function get_id_column() {
		return array('ParameterID', 'TypeID', 'ScaleID');
	}

}

class Address extends PDOModel {
	public $AddressID;
	public $Address;
	public $Length;
	public $OffsetBit;

	public static function get_id_column() {
		return 'AddressID';
	}
}

class Scale extends PDOModel {
	public $ScaleID;
	public $Units;
	public $ExpressionID;
	public $StorageType;

	public static function get_id_column() {
		return 'ScaleID';
	}
}

class ScaleExpression extends PDOModel {
	public $ExpressionID;
	public $Expression;
	public $Format;

	public static function get_id_column() {
		return 'ExpressionID';
	}
}

$debug = isset($argv[1]);

$DB = new PDO("mysql:host=127.0.0.1;port=3306;dbname=subaru", '<user>', '<pass>');

//Test Fetching my ECU
$Logger = simplexml_load_file('logger_STD_EN_v114.xml');

foreach($Logger->xpath("protocols/protocol[@id='SSM']/*/*[@id]") as $Parameter) {
	
	$id = substr((string)$Parameter['id'], 1);
	switch(substr((string)$Parameter['id'], 0, 1)) {
		case 'P':
			$type = 1;
			break;
		case 'S':
			$type = 2;
			break;
		case 'E':
			$type = 3;
			break;
		default:
			throw new Exception("Unknown Type");
			break;
	}
	$paramName = trim((string)$Parameter['name']);

	// is this parameter already defined?
	$ParameterInstance = Parameter::fetch_by_id(array($id, $type), $DB);
	
	// Create the parameter
	if(!$ParameterInstance) {

		echo "$paramName does not exist in DB - Creating...\n";
		$ParameterInstance = new Parameter($DB);
		$ParameterInstance->ParameterID = $id;
		$ParameterInstance->TypeID = $type;

	} else {

		echo "$paramName found...\n";

	}

	$ParameterInstance->Name = $paramName;
	$ParameterInstance->Description = trim((string)$Parameter['desc']);
	$ParameterInstance->ByteIndex = isset($Parameter['ecubyteindex']) ? (int)$Parameter['ecubyteindex'] : null;
	$ParameterInstance->OffsetBit = isset($Parameter['ecubit']) ? (int)$Parameter['ecubit'] : (isset($Parameter['bit']) ? (int)$Parameter['bit'] : null);
	$ParameterInstance->Target = (int)$Parameter['target'];

	if(!$debug) {
		$ParameterInstance->save();
	}

	// Check Address for SSM Parameters and Switches
	if($Parameter->address || $Parameter['byte']) {

		$address = str_pad(trim(str_replace('0x', '', (string)$Parameter->address ?: $Parameter['byte'])), 6, '0', STR_PAD_LEFT);
		$addrLength = (int)$Parameter->address['length'] ?: 1;

		$AddressInstance = Address::fetch_one_where(array(
			'Address' => $address,
			'Length' => $addrLength,
			'ECUID' => null
		), $DB);
		
		if(!$AddressInstance) {

			echo "\tAddress 0x{$address} does not exist in DB - Creating...\n";
			$AddressInstance = new Address($DB);
			
		}

		$AddressInstance->Address = $address;
		$AddressInstance->Length = $addrLength;
		if(!$debug) {
			$AddressInstance->save();
		}

		// Insert Address Relationship
		$ParameterAddressInstance = Parameter_Address::fetch_one_where(array(
			'ParameterID' => $ParameterInstance->ParameterID,
			'TypeID' => $ParameterInstance->TypeID,
			'ECUID' => null
		), $DB);

		if(!$ParameterAddressInstance) {

			echo "\tLink between $paramName and Address 0x$address does not exist in DB - Creating...\n";
			$ParameterAddressInstance = new Parameter_Address($DB);
			$ParameterAddressInstance->ParameterID = $ParameterInstance->ParameterID;
			$ParameterAddressInstance->TypeID = $ParameterInstance->TypeID;

		}

		if ($AddressInstance->AddressID != $ParameterAddressInstance->AddressID) {

			echo "\tUpdating Address Location to 0x$address...\n";
			$ParameterAddressInstance->AddressID = $AddressInstance->AddressID;

		}

		if(!$debug) {
			$res = $ParameterAddressInstance->save();
		}

	}

	// Check Address for Extended Parameters
	if(count($Parameter->ecu)) {
		foreach($Parameter->ecu as $ExtendedParameter) {

			$address = str_pad(trim(str_replace('0x', '', (string)$ExtendedParameter->address)), 6, '0', STR_PAD_LEFT);
			$addrLength = (int)$ExtendedParameter->address['length'] ?: 1;
			$ecu = (string)$ExtendedParameter['id'];

			$AddressInstance = Address::fetch_one_where(array(
				'Address' => $address,
				'Length' => $addrLength
			), $DB);
			
			if(!$AddressInstance) {

				echo "\tAddress 0x{$address} does not exist in DB - Creating...\n";
				$AddressInstance = new Address($DB);
				
			}

			$AddressInstance->Address = $address;
			$AddressInstance->Length = $addrLength;
			if(!$debug) {
				$AddressInstance->save();
			}

			// Insert Address Relationship
			$ParameterAddressInstance = Parameter_Address::fetch_one_where(array(
				'ParameterID' => $ParameterInstance->ParameterID,
				'TypeID' => $ParameterInstance->TypeID,
				'ECUID' => $ecu
			), $DB);

			if(!$ParameterAddressInstance) {

				echo "\tLink between $paramName and Address 0x$address does not exist in DB for $ecu - Creating...\n";
				$ParameterAddressInstance = new Parameter_Address($DB);
				$ParameterAddressInstance->ParameterID = $ParameterInstance->ParameterID;
				$ParameterAddressInstance->TypeID = $ParameterInstance->TypeID;
				$ParameterAddressInstance->ECUID = $ecu;

			}

			if ($AddressInstance->AddressID != $ParameterAddressInstance->AddressID && $ecu == $ParameterAddressInstance->ECUID) {

				echo "\tUpdating Address Location to 0x$address for $ecu...\n";
				$ParameterAddressInstance->AddressID = $AddressInstance->AddressID;

			}

			if(!$debug) {
				$res = $ParameterAddressInstance->save();
			}

		}
	}

	// Check conversions
	if($Parameter->conversions) {
		foreach($Parameter->conversions->conversion as $Conversion) {

			$units = trim((string)$Conversion['units']);
			$format = ((string)$Conversion['format'] == '#' ? '%.0f' : ('%.' . strlen(substr(strstr((string)$Conversion['format'], "."), 1)) . 'f'));
			$storageType = (string)$Conversion['storagetype'] ?: null;

			// First try to find an expression
			$ScaleExpressionInstance = ScaleExpression::fetch_one_where(array(
				'Expression' => trim((string)$Conversion['expr']),
				'Format' => $format
			), $DB);

			if(!$ScaleExpressionInstance) {

				echo "\tExpression {$Conversion['expr']} not found with format $format - Creating...\n";
				$ScaleExpressionInstance = new ScaleExpression($DB);
				$ScaleExpressionInstance->Expression = trim((string)$Conversion['expr']);
				$ScaleExpressionInstance->Format = $format;
				if(!$debug) {
					$ScaleExpressionInstance->save();
				}

			}

			// Now try to find the Scale
			$ScaleInstance = Scale::fetch_one_where(array(
				'Units' => $units,
				'ExpressionID' => $ScaleExpressionInstance->ExpressionID,
				'StorageType' => $storageType
			), $DB);

			if(!$ScaleInstance) {

				echo "\tScaling not found for $units with expression {$ScaleExpressionInstance->Expression} and format {$ScaleExpressionInstance->Format} - Creating...\n";
				$ScaleInstance = new Scale($DB);
				$ScaleInstance->Units = $units;
				$ScaleInstance->ExpressionID = $ScaleExpressionInstance->ExpressionID;
				$ScaleInstance->StorageType = $storageType;
				if(!$debug) {
					$ScaleInstance->save();
				}

			}

			// Update Parameter Scalings
			$ParameterScaleInstance = Parameter_Scale::fetch_by_id(array(
				$ParameterInstance->ParameterID,
				$ParameterInstance->TypeID,
				$ScaleInstance->ScaleID
			), $DB);

			if(!$ParameterScaleInstance) {

				echo "\tLinking {$ParameterInstance->Name} with scale {$ScaleInstance->Units}...\n";
				$ParameterScaleInstance = new Parameter_Scale($DB);
				$ParameterScaleInstance->ParameterID = $ParameterInstance->ParameterID;
				$ParameterScaleInstance->TypeID = $ParameterInstance->TypeID;
				$ParameterScaleInstance->ScaleID = $ScaleInstance->ScaleID;
				
			}

			// Update the other Scale Parameters
			$ParameterScaleInstance->MinValue = isset($Conversion['gauge_min']) ? (float)$Conversion['gauge_min'] : null;
			$ParameterScaleInstance->MaxValue = isset($Conversion['gauge_max']) ? (float)$Conversion['gauge_max'] : null;
			$ParameterScaleInstance->Increment = isset($Conversion['gauge_step']) ? (float)$Conversion['gauge_step'] : null;
			if(!$debug) {
				$ParameterScaleInstance->save();
			}

		}
	}

	// Check dependancies
	if($Parameter->depends) {
		foreach($Parameter->depends->ref as $Reference) {

			$refID = substr((string)$Reference['parameter'], 1);
			switch(substr((string)$Reference['parameter'], 0, 1)) {
				case 'P':
					$refType = 1;
					break;
				case 'S':
					$refType = 2;
					break;
				case 'E':
					$refType = 3;
					break;
				default:
					throw new Exception("Unknown Type");
					break;
			}

			$ReferenceParameter = $Logger->xpath("//*[@id='{$refType}{$refID}']");
			$ReferenceParameter = current($ReferenceParameter);
			
			$depParamName = ucwords(trim((string)$ReferenceParameter['name']));

			// is this parameter already defined?
			$DependantParameterInstance = Parameter::fetch_by_id(array($refID, $refType), $DB);

			// Create the parameter
			if(!$DependantParameterInstance) {

				echo "\tCould not create dependancy between {$Parameter['id']} and {$refID}\n";
				$DependantParameterInstance = new Parameter($DB);
				$DependantParameterInstance->ParameterID = $refID;
				$DependantParameterInstance->TypeID = $refType;
				$DependantParameterInstance->Name = $depParamName;
				$DependantParameterInstance->Description = trim((string)$ReferenceParameter['desc']);
				$DependantParameterInstance->ByteIndex = isset($ReferenceParameter['ecubyteindex']) ? (int)$ReferenceParameter['ecubyteindex'] : null;
				$DependantParameterInstance->OffsetBit = isset($ReferenceParameter['ecubit']) ? (int)$ReferenceParameter['ecubit'] : null;
				$DependantParameterInstance->Target = (int)$ReferenceParameter['target'];

				if(!$debug) {
					$DependantParameterInstance->save();
				}

			}

			// TODO: Insert relationship in ParameterReference
			$ParameterReferenceInstance = ParameterReference::fetch_by_id(array(
				$ParameterInstance->ParameterID,
				$ParameterInstance->TypeID,
				$DependantParameterInstance->ParameterID,
				$DependantParameterInstance->TypeID
			), $DB);

			if(!$ParameterReferenceInstance) {

				$ParameterReferenceInstance = new ParameterReference($DB);
				$ParameterReferenceInstance->ParameterID = $ParameterInstance->ParameterID;
				$ParameterReferenceInstance->ParameterTypeID = $ParameterInstance->TypeID;
				$ParameterReferenceInstance->DependantID = $DependantParameterInstance->ParameterID;
				$ParameterReferenceInstance->DependantTypeID = $DependantParameterInstance->TypeID;
				if(!$debug) {
					$ParameterReferenceInstance->save();
				}

			}

		}
	}

}
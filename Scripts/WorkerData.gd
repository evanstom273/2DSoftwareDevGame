@tool
extends Resource
class_name WorkerResource


enum Region { NORTH_AMERICA, SOUTH_AMERICA, EUROPE, ASIA, AFRICA, OCEANIA }
enum CountryNorthAmerica { USA, CANADA, MEXICO }
enum CountrySouthAmerica { BRAZIL, ARGENTINA, CHILE }
enum CountryEurope { ENGLAND, SCOTLAND, FRANCE, GERMANY, IRELAND, ITALY, SPAIN, WALES }
enum CountryAsia { JAPAN, CHINA, INDIA, SOUTH_KOREA }
enum CountryAfrica { NIGERIA, SOUTH_AFRICA, GHANA }
enum CountryOceania { NEW_ZEALAND, AUSTRALIA, SAMOA }

enum CharacterGender { MALE, FEMALE }

enum WorkerSpecialities { NONE, DESIGN, PROGRAMMING, ART, QA, MARKETING, HARDWARE }

# --- Personal Info ---

@export_group("Character Info")
@export var character_name: String = ""
@export_range(16, 85) var character_age: int = 16
@export var character_gender: CharacterGender = CharacterGender.MALE
@export var birthplace: Region = Region.NORTH_AMERICA:
    set(value):
        birthplace = value
        notify_property_list_changed()

@export var country_north_america: CountryNorthAmerica = CountryNorthAmerica.USA
@export var country_south_america: CountrySouthAmerica = CountrySouthAmerica.BRAZIL
@export var country_europe: CountryEurope = CountryEurope.ENGLAND
@export var country_asia: CountryAsia = CountryAsia.JAPAN
@export var country_africa: CountryAfrica = CountryAfrica.NIGERIA
@export var country_oceania: CountryOceania = CountryOceania.NEW_ZEALAND

@export_group("Specialities")
@export_range(0, 3, 1) var speciality_amount: int = 0:
    set(value):
        speciality_amount = value
        notify_property_list_changed()
@export var speciality_one: WorkerSpecialities = WorkerSpecialities.NONE:
    set(value):
        speciality_one = value
        notify_property_list_changed()
@export_range(0, 3, 1) var speciality_one_level: int = 0
@export var speciality_two: WorkerSpecialities = WorkerSpecialities.NONE:
    set(value):
        speciality_two = value
        notify_property_list_changed()
@export_range(0, 3, 1) var speciality_two_level: int = 0
@export var speciality_three: WorkerSpecialities = WorkerSpecialities.NONE:
    set(value):
        speciality_three = value
        notify_property_list_changed()
@export_range(0, 3, 1) var speciality_three_level: int = 0

func _validate_property(property: Dictionary) -> void:
    # Hide country enums that don't match the current birthplace.
    if property.name == "country_north_america" and birthplace != Region.NORTH_AMERICA:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "country_south_america" and birthplace != Region.SOUTH_AMERICA:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "country_europe" and birthplace != Region.EUROPE:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "country_asia" and birthplace != Region.ASIA:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "country_africa" and birthplace != Region.AFRICA:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "country_oceania" and birthplace != Region.OCEANIA:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "speciality_one" and speciality_amount < 1:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "speciality_two" and speciality_amount < 2:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "speciality_three" and speciality_amount != 3:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "speciality_one_level" and speciality_one == WorkerSpecialities.NONE:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "speciality_two_level" and speciality_two == WorkerSpecialities.NONE:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "speciality_three_level" and speciality_three == WorkerSpecialities.NONE:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "current_company" and is_employed != true:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "current_salary" and is_employed != true:
        property.usage = PROPERTY_USAGE_NO_EDITOR
        
@export_group("Career Info")
@export var is_employed: bool = false:
     set(value):
        is_employed = value
        notify_property_list_changed()
@export var current_company: CompanyResource
@export var current_salary: float = 0
@export var portfolio: Array[ProductResource] = []
@export var previous_awards: Array[AwardsResource] = []
        

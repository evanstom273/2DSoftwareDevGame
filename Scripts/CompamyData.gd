@tool
extends Resource
class_name CompanyResource

enum Region { NONE, NORTH_AMERICA, SOUTH_AMERICA, EUROPE, ASIA, AFRICA, OCEANIA }
enum CompanyType { NONE, SOFTWARE, HARDWARE }

@export_group("Company Info")
@export var company_name = str("")
@export var company_type: Array[CompanyType] = []
@export var home_region = Region.NONE
@export var global_fans: int:
    get:
        return roundi((
            north_america_fans
            + africa_fans
            + south_america_fans
            + europe_fans
            + asia_fans
            + oceania_fans
        ))

@export_group("Fans")
@export_range(0, 1000000000, 1000) var north_america_fans: int = 0
@export_range(0, 1000000000, 1000) var south_america_fans: int = 0
@export_range(0, 1000000000, 1000) var europe_fans: int = 0
@export_range(0, 1000000000, 1000) var asia_fans: int = 0
@export_range(0, 1000000000, 1000) var africa_fans: int = 0
@export_range(0, 1000000000, 1000) var oceania_fans: int = 0

@export_group("Finances, Employees & Products")
@export var employee_list: Array[WorkerResource] = []
@export_range(0.0, 100000000.0, 1000) var company_money: float = 0.0
@export var product_list: Array [ProductResource] = []

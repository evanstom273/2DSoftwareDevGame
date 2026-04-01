@tool
extends Resource
class_name ProductResource

enum ProductType { NONE, SOFTWARE, HARDWARE }
enum SoftwareType { NONE, 
                    GAME, 
                    OS, 
                    OFFICE_SOFTWARE, 
                    GAME_ENGINE, 
                    EDITOR_2D, 
                    EDITOR_3D, 
                    AUDIO_EDITOR }
enum HardwareType { NONE,
                    PC, 
                    CONSOLE, 
                    PHONE, 
                    VR
                    }
enum ConsoleType { NONE, 
                   STANDALONE, 
                   HANDHELD, 
                   HYBRID
}
enum GameGenres {
    NONE,
    ACTION,
    ADVENTURE,
    RPG,
    SHOOTER,
    PLATFORMER,
    PUZZLE,
    HORROR,
    SURVIVAL,
    STRATEGY,
    SIMULATION,
    SANDBOX,
    RACING,
    SPORTS,
    FIGHTING,
    STEALTH,
    RHYTHM,
    PARTY,
    CARD,
    BOARD,
    ROGUELIKE,
    ROGUELITE,
    METROIDVANIA,
    SOULSLIKE,
    VISUAL_NOVEL
}
enum GameTags {
    NONE,
    # Structure / World
    OPEN_WORLD,
    LINEAR,
    LEVEL_BASED,
    PROCEDURAL_GENERATION,
    # Player Modes
    SINGLEPLAYER,
    MULTIPLAYER,
    CO_OP,
    ONLINE,
    LOCAL_MULTIPLAYER,
    # Gameplay Feel
    DIFFICULT,
    CASUAL,
    STORY_RICH,
    CHOICE_DRIVEN,
    # Mechanics
    PERMADEATH,
    LOOT_BASED,
    CRAFTING,
    BASE_BUILDING,
    EXPLORATION,
    # Perspective / Style
    FIRST_PERSON,
    THIRD_PERSON,
    TOP_DOWN,
    ISOMETRIC,
    SIDE_SCROLLING,
    # Presentation
    PIXEL_ART,
    REALISTIC,
    STYLIZED,
    # Progression
    SKILL_TREE,
    LEVELING,
    UPGRADE_SYSTEM
}
enum OfficeSoftwareTypes {
    NONE,
    WORD_PROCESSOR,
    SPREADSHEET,
    PRESENTATION,
    DATABASE,
    EMAIL_CLIENT 
}

@export_group("Product Details")
@export var product_name = str("")
@export var is_owner_company: bool = false:
    set(value):
        is_owner_company = value
        notify_property_list_changed()
@export var owner_company = CompanyResource
@export var owner_worker = WorkerResource
@export var lead_designer = WorkerResource
@export var product_type: ProductType = ProductType.NONE:
    set(value):
        product_type = value
        notify_property_list_changed()
@export var software_type: SoftwareType = SoftwareType.NONE:
    set(value):
        software_type = value
        notify_property_list_changed()
@export var game_genres: Array[GameGenres] = []
@export var game_tags: Array[GameTags] = []
@export var office_software_type: OfficeSoftwareTypes = OfficeSoftwareTypes.NONE
@export var required_game_engine: ProductResource
@export var required_os: ProductResource
@export var required_visual_editor: ProductResource
@export var required_audio_editor: ProductResource
@export var os_target_hardware: HardwareType = HardwareType.NONE
@export var hardware_type: HardwareType = HardwareType.NONE:
    set(value):
        hardware_type = value
        notify_property_list_changed()
@export var console_type: ConsoleType = ConsoleType.NONE

func _validate_property(property: Dictionary) -> void:
    # Show only properties relevant to the selected product setup.
    if property.name == "software_type" and product_type != ProductType.SOFTWARE:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "hardware_type" and product_type != ProductType.HARDWARE:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "console_type" and hardware_type != HardwareType.CONSOLE:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "required_os" and product_type != ProductType.SOFTWARE:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "required_visual_editor" and product_type != ProductType.SOFTWARE:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "required_audio_editor" and product_type != ProductType.SOFTWARE:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "game_genres" and software_type != SoftwareType.GAME:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "game_tags" and software_type != SoftwareType.GAME:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "required_game_engine" and software_type != SoftwareType.GAME:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "required_os" and software_type == SoftwareType.GAME:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "required_os" and software_type == SoftwareType.OS:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "required_visual_editor" and software_type == SoftwareType.EDITOR_2D:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "required_visual_editor" and software_type == SoftwareType.EDITOR_3D:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "required_audio_editor" and software_type == SoftwareType.AUDIO_EDITOR:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "required_visual_editor" and software_type == SoftwareType.GAME:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "required_audio_editor" and software_type == SoftwareType.GAME:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "required_visual_editor" and software_type == SoftwareType.OS:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "required_audio_editor" and software_type == SoftwareType.OS:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "os_target_hardware" and software_type != SoftwareType.OS:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "office_software_type" and software_type != SoftwareType.OFFICE_SOFTWARE:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "owner_company" and is_owner_company == true:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    elif property.name == "owner_worker" and is_owner_company != true:
        property.usage = PROPERTY_USAGE_NO_EDITOR
        
@export_group("Creative & Financial Info")
@export var product_price: float = 0
@export var units_sold: int = 0
@export var development_costs: float = 0
@export var product_profit: float = 0:
    get:
        return ((
            product_price
            * units_sold
        ) - development_costs)
@export_range(0.0, 100.0, 1.0) var phase_1_design_completion: float = 0
@export_range(0.0, 100.0, 1.0) var phase_2_programming_art_completion: float = 0
@export_range(0.0, 100.0, 1.0) var phase_3_qa_completion: float = 0
@export var overall_quality: int = 0:
    get:
        return roundi((
            phase_1_design_completion
            + phase_2_programming_art_completion
            + phase_3_qa_completion
        ) / 3)
@export var awards_won: Array[AwardsResource] = []

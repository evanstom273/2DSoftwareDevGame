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
                    VR, 
                    GRAPHICS_CARD, 
                    PROCESSOR }
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
@export var required_game_engine: ProductResource

func _validate_property(property: Dictionary) -> void:
    # Show only properties relevant to the selected product setup.
    if property.name == "software_type" and product_type != ProductType.SOFTWARE:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    if property.name == "game_genres" and software_type != SoftwareType.GAME:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    if property.name == "game_tags" and software_type != SoftwareType.GAME:
        property.usage = PROPERTY_USAGE_NO_EDITOR
    if property.name == "required_game_engine" and software_type != SoftwareType.GAME:
        property.usage = PROPERTY_USAGE_NO_EDITOR

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

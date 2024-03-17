// Alcon | Slap Fight
// #ID = 14765


function CompanionShipOnScreen() => byte(0x000013) == 1

// 0x0000B0: Scroll Counter, used as offset within a Section
function MapSectionOffset() => (word(0x0000B0) & 0x1FF)

// 0x000181: Game Mode
function GameMode() => byte(0x000181)
GameMode_1PGame = 0x10
GameMode_1PGameOver = 0x31

// 0x000184, 0x000185, 0x000186: Score
function ThousandPoints() => (low4(0x000186) * 100 + high4(0x000185) * 10 + low4(0x000185))
function Score() => (high4(0x000186) * 1000000 + low4(0x000186) * 100000 + high4(0x000185) * 10000 + low4(0x000185) * 1000 + high4(0x000184) * 100 + low4(0x000184) * 10)

// 000189: Number of lives
function LivesRemaining() => byte(0x000189)

// 0x00018B: Map Section
function MapSection() => byte(0x00018B)

// 0x000191: LoopCounter, Zero Points Cheat Bits
function DeadWithZeroPoints() => bit7(0x000191) == 1
function DeadWith0PBeforeArea3() => bit5(0x000191) == 0
function LoopCounterBit4() => bit4(0x000191)
function LoopCounterLow4() => low4(0x000191)
function LoopCounter() => (bit4(0x000191) + low4(0x000191))
function IsFirstLoop() => bit4(0x000191) == 0 && low4(0x000191) == 0
function IsSecondLoop() => bit4(0x000191) == 0 && low4(0x000191) == 1
function IsThirdLoop() => bit4(0x000191) == 0 && low4(0x000191) == 2
function EnhancedArea() => (low4(0x000191) * 100 + bit4(0x000191) * 1600 + byte(0x00018B) * 2 + bit0(0x0000B1))

// 0x000192: Score Update
function ScoreUpdate() => word(0x000192)

// 0x0001A8: Several Uses
function GameInAction() => high4(0x0001A8) == 0 && bit3(0x0001A8) == 1
function C0B0_Protection() => byte(0x0001A8) != 0

// 0x0001AF: Companion Ship Sprite Data
function CompanionShipSkin() => byte(0x0001AF)
CompanionShipSkin_A = 1
CompanionShipSkin_B = 0xE7

// 0x0001BF: Ship Shield
function ShipShield() => byte(0x0001BF)
ShipShield_Off = 0
ShipShield_On = 7

// 0x0001C6: Ship Destruction Animation Counter
function ShipDestructionCounter() => byte(0x0001C6)
ShipDestruction_LastFrame = 0xA0
ShipDestruction_PenUltFrame = 0x9F
ShipDestruction_AntePenUltFrame = 0x9E

// 0x0001D7: Ship Current Weapon
function CurrentWeapon() => byte(0x0001D7)
CurrentWeapon_Shot = 0
CurrentWeapon_Bomb = 1
CurrentWeapon_Laser = 2
CurrentWeapon_HM = 3

// 0x0001DB: Ship Speed
function ShipSpeed() => byte(0x0001DB)
ShipSpeed_Min = 0
ShipSpeed_20pct = 1
ShipSpeed_40pct = 2
ShipSpeed_60pct = 3
ShipSpeed_80pct = 4
ShipSpeed_Max = 5

// 0x0001DC: Ship Wings. Values: 0, 1, 2, 3
function ShipWings() => byte(0x0001DC)
ShipWings_None = 0
ShipWings_1Pair = 1
ShipWings_2Pairs = 2
ShipWings_3Pairs = 3

// 0x0001DE: SideShot and more
function SideShot() => bit6(0x0001DE)
SideShot_On = 1

// 0x000223: Shots Table and Sprite Code of the first sprite in the Shots Table
function NeverShotSoFar() => byte(0x000223) == 0

// 0x00500A: Dip Switch 2
DipSwitch2 = 0x00500A
function DS2Difficulty() => bit0(DipSwitch2) + bit1(DipSwitch2)
function DS2BonusLife()  => bit2(DipSwitch2) + bit3(DipSwitch2)
function DS2Lives()      => bit4(DipSwitch2) + bit5(DipSwitch2)
// This function is not corretly compiled by RATools 1.12.1
// That's why there are differences between Generated and Published
function GameSettingsCheck() => (bitcount(DipSwitch2) - bit6(DipSwitch2) - bit7(DipSwitch2)) == 0

// 0x0059A2: Offset of the tens of 1P points character in character video RAM
// 0x000167: Contains the reference base point
function Player1ScoreTensChar() => byte(word(0x000167) + 0x0059A2)

// Table 0x0003c3: Pointers to the entries in the enemy/object table.
SpriteEntry00 = 0x0003c3
SpriteEntry01 = 0x0003e3
SpriteEntry02 = 0x000403
SpriteEntry03 = 0x000423
SpriteEntry04 = 0x000443
SpriteEntry05 = 0x000463
SpriteEntry06 = 0x000483
SpriteEntry07 = 0x0004a3
SpriteEntry08 = 0x0004c3
SpriteEntry09 = 0x0004e3
SpriteEntry0a = 0x000503
SpriteEntry0b = 0x000523
SpriteEntry0c = 0x000543
SpriteEntry0d = 0x000563
SpriteEntry0e = 0x000583
SpriteEntry0f = 0x0005a3

function SpriteCode(entry) => byte(entry)
function SpritePoints(entry) => word(entry + 0x1C)
function SpritePointsLow8(entry) => byte(entry + 0x1C)
function UpdateRoutinePtr(entry) => word(entry + 0x1E)
function DesertBossHitPoints() => byte(0x0003D3)
function SlapNetsEntranceHitPoints(entry) => byte(entry + 0x07)
function SlapNetsEntranceBackOffCounter(entry) => word(entry + 0x15)

// Other Constants
Enemy_A_Destruction_LastFrame = 0x1C
Enemy_A_Destruction_PenUltFrame = 0x1B

BlankScreenChar = 0x2D

DesertTank_UpdateRoutinePtr = 0x424C

SlapNetsEntrance_UpdateRoutinePtr = 0x51D6
SlapNetsEntrance_BackOff_PenUltFrame = 0xFFF
SlapNetsEntrance_BackOff_LastFrame = 0

TwinyOnRails_SpriteCode = 0x34
TwinyOnRails_UpdateRoutinePtr = 0x466C

LittleInvader_UpdateRoutinePtr = 0x440B
LittleInvader_PointsAfterFirstHit = 2
LittleInvader_30KPoints_LastScore = 0x110
LittleInvader_30KPoints_PenUltScore = 0x10E

Shotty_UpdateRoutinePtr = 0x4E1B
Shotty_Skin_QuestionMark = 3
Shotty_Skin_1UP = 0x3D
function Shotty_Skin_AnyConsumed(entry) => high4(entry + 0x00) == 0x3 &&
                                             bit3(entry + 0x00) == 1 &&
                                             bit2(entry + 0x00) == 1

Roof_UpdateRoutinePtr = 0x506C
Roof_SpriteCode = 0xEE
function Roof_ExplosionCounter(entry) => byte(entry + 0x07)
Roof_ExplosionCounter_LastFrame = 0x1C
Roof_ExplosionCounter_PenUltFrame = 0x1B

Tree_UpdateRoutinePtr = 0x4D18
Tree_Points = 3
function Tree_AnimationCounter(entry) => byte(entry + 0x12)
Tree_AnimationCounter_LastFrame = 0x29
Tree_AnimationCounter_PenUltFrame = 0x28

Rail_UpdateRoutinePtr = 0x3BA2
Rail_Points = 0x25
function Rail_ExplosionCounter(entry) => byte(entry + 0x07)
Rail_ExplosionCounter_LastFrame = 0x10
Rail_ExplosionCounter_PenUltFrame = 0x0F

Plant_UpdateRoutinePtr = 0x50E1
function Plant_GrowthCounter(entry) => byte(entry + 0x07)
Plant_GrowthCounter_LastFrame = 0x67
Plant_GrowthCounter_PenUltFrame = 0x66

Deflector_UpdateRoutinePtr = 0x4D18
Deflector_Points = 0x15
function Deflector_ExplosionCounter(entry) => byte(entry + 0x07)
Deflector_ExplosionCounter_LastFrame = 0x10
Deflector_ExplosionCounter_PenUltFrame = 0x0F

// Other Functions
function ResetHitsOnGameStart_uniqueAlt() => (always_false() || never(prev(byte(0x000181)) != 0x10 && GameMode() == GameMode_1PGame))
function ResetHitsOnGameStart_Alt() => (always_false() && never(prev(byte(0x000181)) != 0x10 && byte(0x000181) == 0x10))
function ResetHitsOnGameStart() => never(prev(byte(0x000181)) != 0x10 && GameMode() == GameMode_1PGame)

// *******************************************************************************************
// * History Intro
// *******************************************************************************************
achievement(
    title = "Get 3x Speed and a Little of History I", points = 1,
    description = "The year is 2059. Humans have been living in exile on the planet Theon since the evil machines of SlapNet raised and attacked their last home, Orac, in 2055.",
    id = 390942, badge = "441892", published = "20/01/2024 10:02:23", modified = "20/01/2024 10:02:23",
    trigger = GameSettingsCheck() &&

              // Trigger
              GameMode() == GameMode_1PGame &&
              ShipSpeed() == ShipSpeed_60pct
)

achievement(
    title = "Get Side Weapon and a Little of History II", points = 1,
    description = "The Allied League of Cosmic Nations ALCON has chosen you to pilot the top secret experimental SW475 Starfighter. You are the last hope there is to stop the rise of the machines.",
    id = 390968, badge = "441936", published = "20/01/2024 10:03:40", modified = "20/01/2024 10:03:40",
    trigger = GameSettingsCheck() &&
 
              // Trigger
              GameMode() == GameMode_1PGame &&
              SideShot() == SideShot_On
)


// *******************************************************************************************
// * First Boss: Alley Battle Rover                                                          *
// *******************************************************************************************
achievement(
    title = "Duel at Silicon Alley", points = 2,
    description = "The first huge battle rover of SlapNet's machine network is defending Silicon Alley. Destroy it. Zero points cheat not allowed.",
    id = 390919, badge = "441848", published = "20/01/2024 10:02:18", modified = "20/01/2024 10:02:18",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints()
              ) &&

              // C0B0_Protection(), 0x0001a8: Changes in weapon changing and wing adding animations.
              // It seems that a lot of people use this short inmunity
              //   Sequence: 0x08 -> 0x88 -> 0x28 a few seconds when you ar inmune -> 0x08
              // Start event (checkpoint): Boss 1 appears
              once(
                  C0B0_Protection() &&
                  MapSection() == 8 &&
                  MapSectionOffset() == 0x1F8
              ) &&

              // Cancel event: If Boss 1 leaves without being destroyed
              never(
                  MapSection() == 0x0A &&
                  MapSectionOffset() == 0x034
              ) &&

              // Cancel: If the ship is destroyed
              never(
                 prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                 ShipDestructionCounter() == ShipDestruction_LastFrame
               ) &&

              // Game Settings Checks
              GameSettingsCheck() &&

              // Trigger: Boss 1 destruction
              prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame &&
              byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame &&

              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Duel at Silicon Alley - Second Loop", points = 25,
    description = "Beat Alley Battle Rover in the second loop. Zero points cheat not allowed.",
    id = 390920, badge = "441849", published = "20/01/2024 10:02:18", modified = "20/01/2024 10:02:18",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints()
              ) &&            

              // Start event (checkpoint): Boss 1 appears in the second loop
              once(
                  C0B0_Protection() &&
                  IsSecondLoop() &&
                  MapSection() == 8 &&
                  MapSectionOffset() == 0x1F8
              ) && 

              // Cancel event: If Boss 1 leaves without being destroyed
              never(
                  MapSection() == 0x0A &&
                  MapSectionOffset() == 0x34
              ) && 
              
              // Cancel: If the ship is destroyed
              never(
                 prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                 ShipDestructionCounter() == ShipDestruction_LastFrame
               ) && 
              
              // Game Settings Checks 
              GameSettingsCheck() &&

              // Trigger: Boss 1 destruction
              prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame &&
              byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame &&
              
              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Duel at Silicon Alley - Shot Only", points = 5,
    description = "Beat Alley Battle Rover without ever changing from Shot to any other weapon, or using Shield, or being killed. Zero points cheat not allowed.",
    id = 390921, badge = "441850", published = "20/01/2024 10:02:18", modified = "20/01/2024 10:02:18",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              // Game session cancel (disabled): If weapon is changed
              // Game session cancel (disabled): If shield is activated
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints() ||
                  CurrentWeapon() != CurrentWeapon_Shot ||
                  ShipShield() != ShipShield_Off
              ) &&

              // Game session cancel (disabled): First life lost
              disable_when(
                 prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                 ShipDestructionCounter() == ShipDestruction_LastFrame
              ) && 
              
              // Start event (checkpoint): Boss 1 appears
              once(
                  C0B0_Protection() &&
                  MapSection() == 8 &&
                  MapSectionOffset() == 0x1F8
              ) && 

              // Cancel event: If Boss 1 leaves without being destroyed
              never(
                  MapSection() == 0x0A &&
                  MapSectionOffset() == 0x34
              ) &&
              
              // Game Settings Checks 
              GameSettingsCheck() &&

              // Trigger: Boss 1 destruction
              trigger_when(prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame) &&
              trigger_when(byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame) &&
              
              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Duel at Silicon Alley - Bomb Only", points = 5,
    description = "Get Bomb before Area 12 and beat Alley Battle Rover. From Area 12 up, don't ever change to a weapon other than Bomb and don't be killed. Never use Shield. Zero points cheat not allowed.",
    id = 390922, badge = "441851", published = "20/01/2024 10:02:18", modified = "20/01/2024 10:02:18",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              // Game session cancel (disabled): If shield is activated
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints() ||
                  ShipShield() != ShipShield_Off
              ) &&

              // Game session cancel (disabled): If change to weapon that is not Bomb
              // Game session cancel (disabled): If not Bomb once in Area 12
              disable_when(
                  CurrentWeapon() != CurrentWeapon_Bomb &&
                  (
                      CurrentWeapon() != prev(CurrentWeapon()) ||
                      MapSection() >= 6
                  )
              ) &&
               
              // Start event (checkpoint): Boss 1 appears
              once(
                  C0B0_Protection() &&
                  MapSection() == 8 &&
                  MapSectionOffset() == 0x1F8
              ) && 

              // Cancel event: If Boss 1 leaves without being destroyed
              never(
                  MapSection() == 0x0A &&
                  MapSectionOffset() == 0x34
              ) &&
               
              // Game Settings Checks 
              GameSettingsCheck() &&

              // Trigger: Boss 1 destruction
              trigger_when(prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame) &&
              trigger_when(byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame) &&

              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Duel at Silicon Alley - Laser Only", points = 5,
    description = "Get Laser before Area 12 and beat Alley Battle Rover. From Area 12 up, don't ever change to a weapon other than Laser and don't be killed. Never use Shield. Zero points cheat not allowed.",
    id = 390923, badge = "441852", published = "20/01/2024 10:02:18", modified = "20/01/2024 10:02:18",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              // Game session cancel (disabled): If shield is activated
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints() ||
                  ShipShield() != ShipShield_Off
              ) &&            
              
              // Game session cancel (disabled): If change to weapon that is not Laser
              // Game session cancel (disabled): If not Laser once in Area 12
              disable_when(
                  CurrentWeapon() != CurrentWeapon_Laser &&
                  (
                      CurrentWeapon() != prev(CurrentWeapon()) ||
                      MapSection() >= 6
                  )
              ) &&

              // Start event (checkpoint): Boss 1 appears
              once(
                  C0B0_Protection() &&
                  MapSection() == 8 &&
                  MapSectionOffset() == 0x1F8
              ) && 

              // Cancel event: If Boss 1 leaves without being destroyed
              never(
                  MapSection() == 0x0A &&
                  MapSectionOffset() == 0x34
              ) &&
               
              // Game Settings Checks 
              GameSettingsCheck() &&

              // Trigger: Boss 1 destruction
              trigger_when(prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame) &&
              trigger_when(byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame) &&

              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Duel at Silicon Alley - H.Mis. Only", points = 5,
    description = "Get H.Mis. before Area 12 and beat Alley Battle Rover. From Area 12 up, don't ever change to a weapon other than H.Mis. and don't be killed. Never use Shield. Zero points cheat not allowed.",
    id = 390924, badge = "441853", published = "20/01/2024 10:02:19", modified = "20/01/2024 10:02:19",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              // Game session cancel (disabled): If shield is activated
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints() ||
                  ShipShield() != ShipShield_Off
              ) &&            
             
              // Game session cancel (disabled): If change to weapon that is not H.Mis.
              // Game session cancel (disabled): If not H.Mis. once in Area 12
              disable_when(
                  CurrentWeapon() != CurrentWeapon_HM &&
                  (
                      CurrentWeapon() != prev(CurrentWeapon()) ||
                      MapSection() >= 6
                  )
              ) &&

              // Start event (checkpoint): Boss 1 appears
              once(
                  C0B0_Protection() &&
                  MapSection() == 8 &&
                  MapSectionOffset() == 0x1F8
              ) && 

              // Cancel event: If Boss 1 leaves without being destroyed
              never(
                  MapSection() == 0x0A &&
                  MapSectionOffset() == 0x34
              ) &&
               
              // Game Settings Checks 
              GameSettingsCheck() &&

              // Trigger: Boss 1 destruction
              trigger_when(prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame) &&
              trigger_when(byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame) &&

              // Alt groups: Reset hits when game starts   
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Duel at Silicon Alley - 2 Wings", points = 5,
    description = "Beat Alley Battle Rover with 2 Wings. The wings must be on before facing Alley Battle Rover. Zero points cheat not allowed.",
    id = 390925, badge = "441854", published = "20/01/2024 10:02:19", modified = "20/01/2024 10:02:19",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints()
              ) &&

              // Don't trigger if not 2 wings
              never(ShipWings() != ShipWings_2Pairs) &&

              // Start event (checkpoint): Boss 1 appears
              once(
                  C0B0_Protection() &&
                  MapSection() == 8 &&
                  (MapSectionOffset() == 0x1F8)
              ) &&

              // Cancel event: If Boss 1 leaves without being destroyed
              never(
                  MapSection() == 0x0A &&
                  MapSectionOffset() == 0x34
              ) &&

              // Cancel: If the ship is destroyed
              never(
                 prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                 ShipDestructionCounter() == ShipDestruction_LastFrame
               ) &&

              // Game Settings Checks 
              GameSettingsCheck() &&

              // Trigger: Boss 1 destruction
              trigger_when(prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame) &&
              trigger_when(byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame) &&

              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Duel at Silicon Alley - 3 Wings", points = 10,
    description = "Beat Alley Battle Rover with 3 Wings. The wings must be on before facing Alley Battle Rover. Zero points cheat not allowed.",
    id = 390926, badge = "441855", published = "20/01/2024 10:02:19", modified = "20/01/2024 10:02:19",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints()
              ) &&

              // Don't trigger if not 3 wings
              never(ShipWings() != ShipWings_3Pairs) &&

              // Start event (checkpoint): Boss 1 appears and ship's got 3 wings
              once(
                  C0B0_Protection() &&
                  MapSection() == 8 &&
                  (MapSectionOffset() == 0x1F8)
              ) &&

              // Cancel event: If Boss 1 leaves without being destroyed
              never(
                  MapSection() == 0x0A &&
                  MapSectionOffset() == 0x34
              ) &&

              // Cancel: If the ship is destroyed
              never(
                 prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                 ShipDestructionCounter() == ShipDestruction_LastFrame
               ) && 

              // Game Settings Checks 
              GameSettingsCheck() &&

              // Trigger: Boss 1 destruction
              trigger_when(prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame) &&
              trigger_when(byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame) &&

              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Duel at Silicon Alley - Full Speed", points = 5,
    description = "Get full 5x speed before Area 6 and keep it until beating Alley Battle Rover. Shield and Zero Points cheat not allowed.",
    id = 390927, badge = "441856", published = "20/01/2024 10:02:19", modified = "20/01/2024 10:02:19",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              // Game session cancel (disabled): If shield is activated
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints() ||
                  ShipShield() != ShipShield_Off
              ) &&            

              // Game session cancel (disabled): If not full speed once in Area 6
              disable_when(
                  MapSection() >= 3 &&
                  ShipSpeed() != ShipSpeed_Max
              ) &&

              // Start event (checkpoint): Boss 1 appears
              once(
                  C0B0_Protection() &&
                  MapSection() == 8 &&
                  MapSectionOffset() == 0x1F8
              ) && 

              // Cancel event: If Boss 1 leaves without being destroyed
              never(
                  MapSection() == 0x0A &&
                  MapSectionOffset() == 0x34
              ) &&

              // Game Settings Checks 
              GameSettingsCheck() &&

              // Trigger: Boss 1 destruction
              trigger_when(prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame) &&
              trigger_when(byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame) &&

              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)


// *******************************************************************************************
// * Second Boss: Desert Battle Tri-Rover
// *******************************************************************************************
achievement(
    title = "The Desert Rovox", points = 5,
    description = "A second, huge, three-headed, articulated rover defends the desert. Destroy it. Zero points cheat not allowed.",
    id = 390928, badge = "441857", published = "20/01/2024 10:02:20", modified = "20/01/2024 10:02:20",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints()
              ) &&

              // Start event (checkpoint): Boss 2 appears
              once(
                  C0B0_Protection() &&
                  MapSection() == 0x14 &&
                  MapSectionOffset() == 0x128
              ) &&
              
              // Cancel event: If Boss 2 leaves without being destroyed
              never(
                  MapSection() == 0x16 &&
                  MapSectionOffset() == 0x080
              ) &&
              
              // Cancel event: If the ship is destroyed
              never(
                 prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                 ShipDestructionCounter() == ShipDestruction_LastFrame
               ) &&
              
              // Game Settings Checks
              GameSettingsCheck() &&

              // Trigger: Boss 2 destruction
              prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame &&
              byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame &&

              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "The Desert Rovox - Second Loop", points = 25,
    description = "Beat Desert Battle Tri-Rover in the second loop. Zero points cheat not allowed.",
    id = 390929, badge = "441858", published = "20/01/2024 10:02:20", modified = "20/01/2024 10:02:20",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints()
              ) &&            

              // Start event (checkpoint): Boss 2 appears in the second loop
              once(
                  C0B0_Protection() &&
                  IsSecondLoop() &&
                  MapSection() == 0x14 &&
                  MapSectionOffset() == 0x128
              ) &&

              // Cancel event: If Boss 2 leaves without being destroyed
              never(
                  MapSection() == 0x16 &&
                  MapSectionOffset() == 0x080
              ) &&
              
              // Cancel: If the ship is destroyed
              never(
                 prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                 ShipDestructionCounter() == ShipDestruction_LastFrame
               ) &&
              
              // Game Settings Checks 
              GameSettingsCheck() &&
              
              // Trigger: Boss 2 destruction
              prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame &&
              byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame &&
              
              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: The Desert Rovox - Shot Only", points = 10,
    description = "Beat Desert Battle Tri-Rover without ever changing from Shot to any other weapon, or using Shield, or being killed. Zero points cheat not allowed.",
    id = 390930, badge = "441859", published = "20/01/2024 10:02:20", modified = "20/01/2024 10:02:20",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              // Game session cancel (disabled): If weapon is changed
              // Game session cancel (disabled): If shield is activated
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints() ||
                  CurrentWeapon() != CurrentWeapon_Shot ||
                  ShipShield() != ShipShield_Off
              ) &&

              // Game session cancel (disabled): First life lost
              disable_when(
                 prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                 ShipDestructionCounter() == ShipDestruction_LastFrame
               ) &&

              // Start event (checkpoint): Boss 2 appears
              once(
                  C0B0_Protection() &&
                  MapSection() == 0x14 &&
                  MapSectionOffset() == 0x128
              ) &&

              // Cancel event: If Boss 2 leaves without being destroyed
              never(
                  MapSection() == 0x16 &&
                  MapSectionOffset() == 0x080
              ) &&             

              // Game Settings Checks 
              GameSettingsCheck() &&

              // Trigger: Boss 2 destruction
              trigger_when(prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame) &&
              trigger_when(byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame) &&

              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: The Desert Rovox - Bomb Only", points = 10,
    description = "Get Bomb before Area 12 and beat Desert Battle Tri-Rover. From Area 12 up, don't ever change to a weapon other than Bomb and don't be killed. Never use Shield. Zero points cheat not allowed.",
    id = 390931, badge = "441860", published = "20/01/2024 10:02:20", modified = "20/01/2024 10:02:20",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              // Game session cancel (disabled): If shield is activated
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints() ||
                  ShipShield() != ShipShield_Off
              ) &&

              // Game session cancel (disabled): If change to weapon that is not Bomb
              // Game session cancel (disabled): If not Bomb once in Area 12
              disable_when(
                  CurrentWeapon() != CurrentWeapon_Bomb &&
                  (
                      CurrentWeapon() != prev(CurrentWeapon()) ||
                      MapSection() >= 6
                  )
              ) &&

              // Start event (checkpoint): Boss 2 appears
              once(
                  C0B0_Protection() &&
                  MapSection() == 0x14 &&
                  MapSectionOffset() == 0x128
              ) &&

              // Cancel event: If Boss 2 leaves without being destroyed
              never(
                  MapSection() == 0x16 &&
                  MapSectionOffset() == 0x080
              ) &&             

              // Game Settings Checks 
              GameSettingsCheck() &&

              // Trigger: Boss 2 destruction
              trigger_when(prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame) &&
              trigger_when(byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame) &&

              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: The Desert Rovox - Laser Only", points = 10,
    description = "Get Laser before Area 12 and beat Desert Battle Tri-Rover. From Area 12 up, don't ever change to a weapon other than Laser and don't be killed. Never use Shield. Zero points cheat not allowed.",
    id = 390932, badge = "441861", published = "20/01/2024 10:02:20", modified = "20/01/2024 10:02:20",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              // Game session cancel (disabled): If shield is activated
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints() ||
                  ShipShield() != ShipShield_Off
              ) &&

              // Game session cancel (disabled): If change to weapon that is not Laser
              // Game session cancel (disabled): If not Laser once in Area 12
              disable_when(
                  CurrentWeapon() != CurrentWeapon_Laser &&
                  (
                      CurrentWeapon() != prev(CurrentWeapon()) ||
                      MapSection() >= 6
                  )
              ) &&

              // Start event (checkpoint): Boss 2 appears
              once(
                  C0B0_Protection() &&
                  MapSection() == 0x14 &&
                  MapSectionOffset() == 0x128
              ) &&

              // Cancel event: If Boss 2 leaves without being destroyed
              never(
                  MapSection() == 0x16 &&
                  MapSectionOffset() == 0x080
              ) &&             

              // Game Settings Checks 
              GameSettingsCheck() &&

              // Trigger: Boss 2 destruction
              trigger_when(prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame) &&
              trigger_when(byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame) &&

              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: The Desert Rovox - H.Mis. Only", points = 10,
    description = "Get H.Mis. before Area 12 and beat Desert Battle Tri-Rover. From Area 12 up, don't ever change to a weapon other than H.Mis. and don't be killed. Never use Shield. Zero points cheat not allowed.",
    id = 390933, badge = "441862", published = "20/01/2024 10:02:21", modified = "20/01/2024 10:02:21",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              // Game session cancel (disabled): If shield is activated
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints() ||
                  ShipShield() != ShipShield_Off
              ) &&

              // Game session cancel (disabled): If change to weapon that is not H.Mis.
              // Game session cancel (disabled): If not H.Mis. once in Area 12
              disable_when(
                  CurrentWeapon() != CurrentWeapon_HM &&
                  (
                      CurrentWeapon() != prev(CurrentWeapon()) ||
                      MapSection() >= 6
                  )
              ) &&

              // Start event (checkpoint): Boss 2 appears
              once(
                  C0B0_Protection() &&
                  MapSection() == 0x14 &&
                  MapSectionOffset() == 0x128
              ) &&

              // Cancel event: If Boss 2 leaves without being destroyed
              never(
                  MapSection() == 0x16 &&
                  MapSectionOffset() == 0x080
              ) &&             

              // Game Settings Checks 
              GameSettingsCheck() &&

              // Trigger: Boss 2 destruction
              trigger_when(prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame) &&
              trigger_when(byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame) &&

              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: The Desert Rovox - 2 Wings", points = 25,
    description = "Beat Desert Battle Tri-Rover with 2 Wings. The wings must be on before facing Dessert Battle Tri-Rover. Zero points cheat not allowed.",
    id = 390934, badge = "441864", published = "20/01/2024 10:02:21", modified = "20/01/2024 10:02:21",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints()
              ) &&

              // Don't trigger if not 2 wings
              never(ShipWings() != ShipWings_2Pairs) &&

              // Start event (checkpoint): Boss 2 appears
              once(
                  C0B0_Protection() &&
                  MapSection() == 0x14 &&
                  MapSectionOffset() == 0x128
              ) &&

              // Cancel event: If Boss 2 leaves without being destroyed
              never(
                  MapSection() == 0x16 &&
                  MapSectionOffset() == 0x080
              ) &&             

              // Cancel: If the ship is destroyed
              never(
                 prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                 ShipDestructionCounter() == ShipDestruction_LastFrame
               ) &&

              // Game Settings Checks 
              GameSettingsCheck() &&

              // Trigger: Boss 2 destruction
              trigger_when(prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame) &&
              trigger_when(byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame) &&

              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: The Desert Rovox - 3 Wings", points = 50,
    description = "Beat Dessert Battle Tri-Rover with 3 Wings. The wings must be on before facing Dessert Battle Tri-Rover. Zero points cheat not allowed.",
    id = 390946, badge = "441903", published = "20/01/2024 10:03:13", modified = "20/01/2024 10:03:13",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints()
              ) &&

              // Don't trigger if not 3 wings
              never(ShipWings() != ShipWings_3Pairs) &&

              // Start event (checkpoint): Boss 2 appears
              once(
                  C0B0_Protection() &&
                  MapSection() == 0x14 &&
                  MapSectionOffset() == 0x128
              ) &&

              // Cancel event: If Boss 2 leaves without being destroyed
              never(
                  MapSection() == 0x16 &&
                  MapSectionOffset() == 0x080
              ) &&             

              // Cancel: If the ship is destroyed
              never(
                 prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                 ShipDestructionCounter() == ShipDestruction_LastFrame
               ) &&

              // Game Settings Checks
              GameSettingsCheck() &&

              // Trigger: Boss 2 destruction
              trigger_when(prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame) &&
              trigger_when(byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame) &&

              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)
achievement(
    title = "Challenge: The Desert Rovox Won't Charge", points = 10,
    description = "Challenge: Destroy Dessert Battle Tri-Rover before its final charge attack movement. Zero points cheat not allowed.",
    id = 390945, badge = "441902", published = "20/01/2024 10:03:13", modified = "20/01/2024 10:03:13",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints()
              ) &&

              // Start event (checkpoint): Boss 2 appears
              once(
                  C0B0_Protection() &&
                  MapSection() == 0x14 &&
                  MapSectionOffset() == 0x128
              ) &&

              // Cancel event: If Boss 2 leaves without being destroyed
              never(
                  MapSection() == 0x16 &&
                  MapSectionOffset() == 0x080
              ) &&             

              // Cancel event: If the ship is destroyed
              never(
                 prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                 ShipDestructionCounter() == ShipDestruction_LastFrame
               ) &&

              // Game Settings Checks
              GameSettingsCheck() &&

              trigger_when(DesertBossHitPoints() == 0) &&
              trigger_when(prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame) && 
              trigger_when(byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame) &&
              
              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)


// *******************************************************************************************
// * Tank Wave
// *******************************************************************************************
achievement(
    title = "Challenge: Laser to the Panzer", points = 10,
    description = "Destroy all tanks of the desert tank wave with Laser, and without being killed once the wave begins. Shield not allowed.",
    id = 390947, badge = "441904", published = "20/01/2024 10:03:13", modified = "20/01/2024 10:03:13",
    trigger = // Prevent tally from counting hits outside 1P Game
              disable_when(GameMode() != GameMode_1PGame) &&

              // Start event (checkpoint): reaching the wave
              once(
                  C0B0_Protection() &&
                  MapSection() == 0x19 &&
                  MapSectionOffset() == 0x128
              ) &&

              // Cancel: If the wave is left behind
              // NOTE: If you get killed in Section 0x1a, you restart in Section 0x1b, offset 0.
              //  You'd still be able to croos this cancel "line"
              never(
                  MapSection() == 0x1B &&
                  MapSectionOffset() == 0x09E
              ) &&

              // Cancel: If the ship is destroyed
              never(
                 prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                 ShipDestructionCounter() == ShipDestruction_LastFrame
               ) &&

              // Cancel: If the shield is on
              never(ShipShield() != ShipShield_Off) &&

              // Game Settings Checks
              GameSettingsCheck() &&

              // We count only when using Laser
              measured(tally(38, 
                  UpdateRoutinePtr(SpriteEntry00) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry01) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry01 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry01 + 0x07) == Enemy_A_Destruction_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry02) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry02 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry02 + 0x07) == Enemy_A_Destruction_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry03) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry03 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry03 + 0x07) == Enemy_A_Destruction_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry04) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry04 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry04 + 0x07) == Enemy_A_Destruction_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry05) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry05 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry05 + 0x07) == Enemy_A_Destruction_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry06) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry06 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry06 + 0x07) == Enemy_A_Destruction_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry07) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry07 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry07 + 0x07) == Enemy_A_Destruction_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry08) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry08 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry08 + 0x07) == Enemy_A_Destruction_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry09) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry09 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry09 + 0x07) == Enemy_A_Destruction_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0a) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry0a + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry0a + 0x07) == Enemy_A_Destruction_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0b) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry0b + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry0b + 0x07) == Enemy_A_Destruction_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0c) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry0c + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry0c + 0x07) == Enemy_A_Destruction_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0d) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry0d + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry0d + 0x07) == Enemy_A_Destruction_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0e) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry0e + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry0e + 0x07) == Enemy_A_Destruction_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0f) == DesertTank_UpdateRoutinePtr && prev(byte(SpriteEntry0f + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry0f + 0x07) == Enemy_A_Destruction_LastFrame
              ), when=(CurrentWeapon() == CurrentWeapon_Laser)) &&

              // Alt groups: Reset hits when game starts
              ResetHitsOnGameStart_uniqueAlt()
)


// *******************************************************************************************
// * Third Boss: SlapNet defends the main entrance
// *******************************************************************************************
achievement(
    title = "Into SlapNet's Nest", points = 10,
    description = "SlapNet is defending the entrance to is Head Motherboard Facilities. Make it back off. Zero points cheat not allowed.",
    id = 390935, badge = "441867", published = "20/01/2024 10:02:21", modified = "20/01/2024 10:02:21",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints()
                ) &&

                // Start event (checkpoint): We reach Boss 3 location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x22 &&
                    MapSectionOffset() == 0x068
                ) &&

                // Cancel event: If the ship is destroyed
                never(
                   prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                   ShipDestructionCounter() == ShipDestruction_LastFrame
                ) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When Boss 3 backs off and we can continue
                MapSection() == 0x22 && 
                MapSectionOffset() == 0xEA &&
              
                // Alt groups: Reset hits when game starts
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Into SlapNet's Nest - Second Loop", points = 25,
    description = "Make SlapNet back off in the second loop. Zero points cheat not allowed.",
    id = 390948, badge = "441905", published = "20/01/2024 10:03:13", modified = "20/01/2024 10:03:13",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints()
                ) &&

                // Start event (checkpoint): We reach Boss 3 location in the second loop
                once(
                    C0B0_Protection() &&
                    IsSecondLoop() &&
                    MapSection() == 0x22 &&
                    MapSectionOffset() == 0x068
                ) &&

                // Cancel event: If the ship is destroyed
                never(
                   prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                   ShipDestructionCounter() == ShipDestruction_LastFrame
                ) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When Boss 3 backs off and we can continue
                // It disappears at section offset 0x0e9
                MapSection() == 0x22 && 
                MapSectionOffset() == 0xEA &&
              
                // Alt groups: Reset hits when game starts
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Into SlapNet's Nest - Shot Only", points = 10,
    description = "Make SlapNet back off without ever changing from Shot to any other weapon, or using Shield, or being killed. Zero points cheat not allowed.",
    id = 390949, badge = "441906", published = "20/01/2024 10:03:14", modified = "20/01/2024 10:03:14",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                // Game session cancel (disabled): If weapon is changed
                // Game session cancel (disabled): If shield is activated
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    CurrentWeapon() != CurrentWeapon_Shot ||
                    ShipShield() != ShipShield_Off ||
                    DeadWithZeroPoints()
                ) &&

                // Game session cancel (disabled): First life lost
                disable_when(
                   prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                   ShipDestructionCounter() == ShipDestruction_LastFrame
                ) &&

                // Start event (checkpoint): We reach Boss 3 location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x22 &&
                    MapSectionOffset() == 0x068
                ) &&

                // Cancel event: Boss 3 backs off due to time out
                // One reset per animation slot
                never(UpdateRoutinePtr(SpriteEntry00) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry00)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry00) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry01) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry01)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry01) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry02) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry02)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry02) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry03) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry03)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry03) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry04) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry04)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry04) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry05) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry05)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry05) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry06) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry06)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry06) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry07) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry07)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry07) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry08) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry08)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry08) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry09) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry09)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry09) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0a) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0a)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0a) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0b) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0b)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0b) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0c) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0c)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0c) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0d) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0d)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0d) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0e) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0e)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0e) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0f) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0f)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0f) == SlapNetsEntrance_BackOff_LastFrame) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When Boss 3 backs off and we can continue
                // We cannot simply check for bytes SpriteEntry00 + 0x15, SpriteEntry01 + 0x15,... to be != 0 at this point
                // because these counters are also use to animate the gate opening, so
                // the game scroll resumes when they, one of them indeed, reach 0.
                trigger_when(MapSection() == 0x22) &&
                trigger_when(MapSectionOffset() == 0xEA) &&
             
                // Alt groups: Reset hits when game starts
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Into SlapNet's Nest - Bomb Only", points = 10,
    description = "Get Bomb before Area 12 and make SlapNet back off. From Area 12 up, don't ever change to a weapon other than Bomb and don't be killed. Never use Shield. Zero points cheat not allowed.",
    id = 390936, badge = "441870", published = "20/01/2024 10:02:22", modified = "20/01/2024 10:02:22",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                // Game session cancel (disabled): If shield is activated
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints() ||
                    ShipShield() != ShipShield_Off
                ) &&

                // Game session cancel (disabled): If change to weapon that is not Bomb
                // Game session cancel (disabled): If not Bomb once in Area 12
                disable_when(
                    CurrentWeapon() != CurrentWeapon_Bomb &&
                    (
                        CurrentWeapon() != prev(CurrentWeapon()) ||
                        MapSection() >= 6
                    )
                ) &&

                // Start event (checkpoint): We reach Boss 3 location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x22 &&
                    MapSectionOffset() == 0x068
                ) &&

                // Cancel event: Boss 3 backs off due to time out
                // One reset per animation slot
                never(UpdateRoutinePtr(SpriteEntry00) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry00)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry00) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry01) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry01)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry01) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry02) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry02)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry02) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry03) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry03)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry03) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry04) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry04)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry04) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry05) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry05)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry05) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry06) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry06)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry06) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry07) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry07)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry07) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry08) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry08)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry08) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry09) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry09)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry09) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0a) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0a)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0a) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0b) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0b)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0b) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0c) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0c)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0c) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0d) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0d)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0d) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0e) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0e)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0e) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0f) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0f)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0f) == SlapNetsEntrance_BackOff_LastFrame) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When Boss 3 retreats and we can continue
                trigger_when(MapSection() == 0x22) &&
                trigger_when(MapSectionOffset() == 0xEA) &&

                // Alt groups: Reset hits when game starts
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Into SlapNet's Nest - Laser Only", points = 10,
    description = "Get Laser before Area 12 and make SlapNet back off. From Area 12 up, don't ever change to a weapon other than Laser and don't be killed. Never use Shield. Zero points cheat not allowed.",
    id = 390950, badge = "441907", published = "20/01/2024 10:03:14", modified = "20/01/2024 10:03:14",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                // Game session cancel (disabled): If shield is activated
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints() ||
                    ShipShield() != ShipShield_Off
                ) &&

                // Game session cancel (disabled): If change to weapon that is not Laser
                // Game session cancel (disabled): If not Laser once in Area 12
                disable_when(
                    CurrentWeapon() != CurrentWeapon_Laser &&
                    (
                        CurrentWeapon() != prev(CurrentWeapon()) ||
                        MapSection() >= 6
                    )
                ) &&

                // Start event (checkpoint): We reach Boss 3 location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x22 &&
                    MapSectionOffset() == 0x068
                ) &&

                // Cancel event: Boss 3 retreats due to time out
                // One reset per animation slot
                never(UpdateRoutinePtr(SpriteEntry00) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry00)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry00) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry01) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry01)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry01) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry02) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry02)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry02) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry03) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry03)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry03) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry04) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry04)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry04) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry05) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry05)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry05) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry06) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry06)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry06) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry07) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry07)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry07) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry08) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry08)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry08) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry09) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry09)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry09) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0a) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0a)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0a) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0b) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0b)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0b) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0c) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0c)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0c) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0d) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0d)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0d) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0e) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0e)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0e) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0f) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0f)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0f) == SlapNetsEntrance_BackOff_LastFrame) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When Boss 3 retreats and we can continue
                trigger_when(MapSection() == 0x22) &&
                trigger_when(MapSectionOffset() == 0xEA) &&

                // Alt groups: Reset hits when game starts
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Into SlapNet's Nest - H.Mis. Only", points = 10,
    description = "Get H.Mis. before Area 12 and make SlapNet back off. From Area 12 up, don't ever change to a weapon other than H.Mis. and don't be killed. Never use Shield. Zero points cheat not allowed.",
    id = 390951, badge = "441908", published = "20/01/2024 10:03:14", modified = "20/01/2024 10:03:14",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                // Game session cancel (disabled): If shield is activated
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints() ||
                    ShipShield() != ShipShield_Off
                ) &&

                // Game session cancel (disabled): If change to weapon that is not H.Mis.
                // Game session cancel (disabled): If not H.Mis. once in Area 12
                disable_when(
                    CurrentWeapon() != CurrentWeapon_HM &&
                    (
                        CurrentWeapon() != prev(CurrentWeapon()) ||
                        MapSection() >= 6
                    )
                ) &&

                // Start event (checkpoint): We reach Boss 3 location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x22 &&
                    MapSectionOffset() == 0x068
                ) &&

                // Cancel event: Boss 3 retreats due to time out
                // One reset per animation slot
                never(UpdateRoutinePtr(SpriteEntry00) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry00)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry00) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry01) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry01)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry01) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry02) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry02)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry02) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry03) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry03)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry03) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry04) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry04)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry04) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry05) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry05)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry05) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry06) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry06)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry06) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry07) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry07)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry07) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry08) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry08)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry08) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry09) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry09)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry09) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0a) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0a)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0a) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0b) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0b)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0b) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0c) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0c)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0c) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0d) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0d)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0d) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0e) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0e)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0e) == SlapNetsEntrance_BackOff_LastFrame) &&
                never(UpdateRoutinePtr(SpriteEntry0f) == SlapNetsEntrance_UpdateRoutinePtr && prev(SlapNetsEntranceBackOffCounter(SpriteEntry0f)) == SlapNetsEntrance_BackOff_PenUltFrame && SlapNetsEntranceBackOffCounter(SpriteEntry0f) == SlapNetsEntrance_BackOff_LastFrame) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When Boss 3 retreats and we can continue
                trigger_when(MapSection() == 0x22) &&
                trigger_when(MapSectionOffset() == 0xEA) &&

                // Alt groups: Reset hits when game starts
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Into SlapNet's Nest - 2 Wings", points = 10,
    description = "Make SlapNet back off with 2 Wings. The wings must be on before facing SlapNet. Zero points cheat not allowed.",
    id = 390937, badge = "441874", published = "20/01/2024 10:02:22", modified = "20/01/2024 10:02:22",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints()
                ) &&

                // Don't trigger if not 2 wings
                never(ShipWings() != ShipWings_2Pairs) &&

                // Start event (checkpoint): We reach Boss 3 location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x22 &&
                    MapSectionOffset() == 0x068
                ) &&

                // Cancel event: If the ship is destroyed
                never(
                   prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                   ShipDestructionCounter() == ShipDestruction_LastFrame
                ) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When Boss 3 retreats and we can continue
                trigger_when(MapSection() == 0x22) &&
                trigger_when(MapSectionOffset() == 0xEA) &&

                // Alt groups: Reset hits when game starts
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Into SlapNet's Nest - 3 Wings", points = 10,
    description = "Make SlapNet back off with 3 Wings. The wings must be on before facing SlapNet. Zero points cheat not allowed.",
    id = 390953, badge = "441910", published = "20/01/2024 10:03:14", modified = "20/01/2024 10:03:14",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints()
                ) &&

                // Don't trigger if not 3 wings
                never(ShipWings() != ShipWings_3Pairs) &&

                // Start event (checkpoint): We reach Boss 3 location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x22 &&
                    MapSectionOffset() == 0x068
                ) &&

                // Cancel event: If the ship is destroyed
                never(
                   prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                   ShipDestructionCounter() == ShipDestruction_LastFrame
                ) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When Boss 3 retreats and we can continue
                trigger_when(MapSection() == 0x22) &&
                trigger_when(MapSectionOffset() == 0xEA) &&

                // Alt groups: Reset hits when game starts
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Into SlapNet's Nest by Time", points = 25,
    description = "Make SlapNet back off without damaging it badly, enduring util it backs off on its own. Zero points cheat not allowed.",
    id = 390952, badge = "441909", published = "20/01/2024 10:03:14", modified = "20/01/2024 10:03:14",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints()
                ) &&

                // Start event (checkpoint): We reach Boss 3 location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x22 &&
                    MapSectionOffset() == 0x068
                ) &&

                // Cancel event: Boss 3 retreats due to severe damage
                // One reset per animation slot
                // Maybe we'll need here a Delta
                never(UpdateRoutinePtr(SpriteEntry00) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry00) >= 0x46) && 
                never(UpdateRoutinePtr(SpriteEntry01) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry01) >= 0x46) && 
                never(UpdateRoutinePtr(SpriteEntry02) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry02) >= 0x46) && 
                never(UpdateRoutinePtr(SpriteEntry03) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry03) >= 0x46) && 
                never(UpdateRoutinePtr(SpriteEntry04) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry04) >= 0x46) && 
                never(UpdateRoutinePtr(SpriteEntry05) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry05) >= 0x46) && 
                never(UpdateRoutinePtr(SpriteEntry06) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry06) >= 0x46) && 
                never(UpdateRoutinePtr(SpriteEntry07) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry07) >= 0x46) && 
                never(UpdateRoutinePtr(SpriteEntry08) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry08) >= 0x46) && 
                never(UpdateRoutinePtr(SpriteEntry09) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry09) >= 0x46) && 
                never(UpdateRoutinePtr(SpriteEntry0a) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry0a) >= 0x46) && 
                never(UpdateRoutinePtr(SpriteEntry0b) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry0b) >= 0x46) && 
                never(UpdateRoutinePtr(SpriteEntry0c) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry0c) >= 0x46) && 
                never(UpdateRoutinePtr(SpriteEntry0d) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry0d) >= 0x46) && 
                never(UpdateRoutinePtr(SpriteEntry0e) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry0e) >= 0x46) && 
                never(UpdateRoutinePtr(SpriteEntry0f) == SlapNetsEntrance_UpdateRoutinePtr && SlapNetsEntranceHitPoints(SpriteEntry0f) >= 0x46) &&
              
                // Cancel event: If the ship is destroyed
                never(
                   prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                   ShipDestructionCounter() == ShipDestruction_LastFrame
                ) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When Boss 3 retreats and we can continue
                trigger_when(MapSection() == 0x22) &&
                trigger_when(MapSectionOffset() == 0xEA) &&

                // Alt groups: Reset hits when game starts
                ResetHitsOnGameStart_uniqueAlt()
)


// *******************************************************************************************
// * Tank Wave
// *******************************************************************************************
achievement(
    title = "Twiny on Rails", points = 5,
    description = "The last stumbling block in our way to the Main Socket is 'Twiny' on Rails, the fearsome pair of on-rails battle rovers that defend the supply chains of the Head Motherboard Facilities. Destroy them. Zero points cheat not allowed.",
    id = 390954, badge = "441911", published = "20/01/2024 10:03:15", modified = "20/01/2024 10:03:15",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints()
                ) &&

                // Start event (checkpoint): We reach first member of the pair
                // We apply offset protection with C0B0_Protection()
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x23 &&
                    MapSectionOffset() == 0x188
                ) &&

                // Cancel: If we get by without having destroyed both members
                never(
                    MapSection() == 0x25 &&
                    MapSectionOffset() == 0x137
                ) &&

                // Cancel: If the ship is destroyed
                // NOTE: If you get killed in Section 0x24 (when both twin rovers gather), something very likely,
                //  you'll restart in Section 0x22 (if there are remaining lives).
                //  Besides, section offset (0x00b0) is used whent starting or restarting
                //  a game to time the horizontal courtain removal effect from 0 to 0x200
                //  and the checkpoint 0x22:0x068 will be hit. This is the checkpoint of
                //  achievements and leaderboards related to SlapNet's Entrance.
                //  byte(0x0001A8), C0B0_Protection(), follows this sequence:
                //    0x08 -> Ship destroyed, explosion begins -> 0x88 -> Courtain on -> 0x00 -> Timing to 0x200 -> 0x40 -> Courtain off -> 0x08
                //  byte(0x0001A8) isn't suitable for this purpose: It changes is similar way when adding wings to the ship.
                never(
                   prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                   ShipDestructionCounter() == ShipDestruction_LastFrame
                ) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When both members of the pair are destroyed
                // We add bytes +$00 in order not to hit when destroying Alley Rover and
                // Desert Rover, which have same +$1e and explosion counter.
                measured(tally(2, 
                    SpriteCode(SpriteEntry00) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry00) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry00 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry00 + 0x07) == Enemy_A_Destruction_LastFrame, 
                    SpriteCode(SpriteEntry01) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry01) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry01 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry01 + 0x07) == Enemy_A_Destruction_LastFrame, 
                    SpriteCode(SpriteEntry02) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry02) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry02 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry02 + 0x07) == Enemy_A_Destruction_LastFrame, 
                    SpriteCode(SpriteEntry03) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry03) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry03 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry03 + 0x07) == Enemy_A_Destruction_LastFrame, 
                    SpriteCode(SpriteEntry04) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry04) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry04 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry04 + 0x07) == Enemy_A_Destruction_LastFrame, 
                    SpriteCode(SpriteEntry05) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry05) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry05 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry05 + 0x07) == Enemy_A_Destruction_LastFrame, 
                    SpriteCode(SpriteEntry06) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry06) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry06 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry06 + 0x07) == Enemy_A_Destruction_LastFrame, 
                    SpriteCode(SpriteEntry07) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry07) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry07 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry07 + 0x07) == Enemy_A_Destruction_LastFrame, 
                    SpriteCode(SpriteEntry08) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry08) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry08 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry08 + 0x07) == Enemy_A_Destruction_LastFrame, 
                    SpriteCode(SpriteEntry09) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry09) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry09 + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry09 + 0x07) == Enemy_A_Destruction_LastFrame, 
                    SpriteCode(SpriteEntry0a) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry0a) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry0a + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry0a + 0x07) == Enemy_A_Destruction_LastFrame, 
                    SpriteCode(SpriteEntry0b) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry0b) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry0b + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry0b + 0x07) == Enemy_A_Destruction_LastFrame, 
                    SpriteCode(SpriteEntry0c) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry0c) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry0c + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry0c + 0x07) == Enemy_A_Destruction_LastFrame, 
                    SpriteCode(SpriteEntry0d) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry0d) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry0d + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry0d + 0x07) == Enemy_A_Destruction_LastFrame, 
                    SpriteCode(SpriteEntry0e) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry0e) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry0e + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry0e + 0x07) == Enemy_A_Destruction_LastFrame, 
                    SpriteCode(SpriteEntry0f) == TwinyOnRails_SpriteCode && UpdateRoutinePtr(SpriteEntry0f) == TwinyOnRails_UpdateRoutinePtr && prev(byte(SpriteEntry0f + 0x07)) == Enemy_A_Destruction_PenUltFrame && byte(SpriteEntry0f + 0x07) == Enemy_A_Destruction_LastFrame
                )) &&

                // Alt groups: Reset hits when game starts
                ResetHitsOnGameStart_uniqueAlt()
)


// *******************************************************************************************
// * Destroy SlapNet, final Boss
// *******************************************************************************************
achievement(
    title = "Terminate SlapNet", points = 25,
    description = "Finaly you get to the Head Motherboard Facilities Main Socket where you will destroy the ultimate evil artificial general superintelligence: SlapNet. Zero points cheat not allowed.",
    id = 390938, badge = "441877", published = "20/01/2024 10:02:22", modified = "20/01/2024 10:02:22",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints()
                ) &&

                // Start event (checkpoint): We reach Final Boss location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x28 &&
                    MapSectionOffset() == 0x080
                ) &&

                // Cancel event: If the ship is destroyed
                never(
                   prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                   ShipDestructionCounter() == ShipDestruction_LastFrame
                ) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When we reach SlapNet, game scroll pauses at section offset 0x0df
                // Once destroyed, game scroll resumes increasing the offset
                MapSection() == 0x28 && 
                MapSectionOffset() == 0x0E0 && 
              
                // Alt groups: Reset hits when game start
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Terminate SlapNet Judgement Day", points = 25,
    description = "Destroy SlapNet in its first 'reinrackation' (second loop). Zero points cheat not allowed.",
    id = 390955, badge = "441912", published = "20/01/2024 10:03:15", modified = "20/01/2024 10:03:15",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints()
                ) &&

                // Start event (checkpoint): We reach Final Boss location in the second loop
                once(
                    IsSecondLoop() &&
                    C0B0_Protection() &&
                    MapSection() == 0x28 &&
                    MapSectionOffset() == 0x080
                ) &&

                // Cancel event: If the ship is destroyed
                never(
                   prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                   ShipDestructionCounter() == ShipDestruction_LastFrame
                ) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When we reach SlapNet, game scroll pauses at section offset 0x0df
                // Once destroyed, game scroll resumes increasing the offset
                C0B0_Protection() &&
                MapSection() == 0x28 && 
                MapSectionOffset() == 0x0E0 && 
              
                // Alt groups: Reset hits when game start
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Terminate SlapNet - Shot Only", points = 25,
    description = "Destroy SlapNet without ever changing from Shot to any other weapon, or using Shield, or being killed. Zero points cheat not allowed.",
    id = 390956, badge = "441913", published = "20/01/2024 10:03:15", modified = "20/01/2024 10:03:15",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                // Game session cancel (disabled): If weapon is changed
                // Game session cancel (disabled): If shield is activated
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    CurrentWeapon() != CurrentWeapon_Shot ||
                    ShipShield() != ShipShield_Off ||
                    DeadWithZeroPoints()
                ) &&

                // Game session cancel (disabled): First life lost
                disable_when(
                   prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                   ShipDestructionCounter() == ShipDestruction_LastFrame
                ) &&

                // Start event (checkpoint): We reach Final Boss location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x28 &&
                    MapSectionOffset() == 0x080
                ) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When we reach SlapNet, game scroll pauses at section offset 0x0df
                // Once destroyed, game scroll resumes increasing the offset
                trigger_when(MapSection() == 0x28) && 
                trigger_when(MapSectionOffset() == 0x0E0) && 
              
                // Alt groups: Reset hits when game start
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Terminate SlapNet - Bomb Only", points = 25,
    description = "Get Bomb before Area 12 and destroy SlapNet. From Area 12 up, don't ever change to a weapon other than Bomb and don't be killed. Never use Shield. Zero points cheat not allowed.",
    id = 390962, badge = "441930", published = "20/01/2024 10:03:38", modified = "20/01/2024 10:03:38",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                // Game session cancel (disabled): If shield is activated
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints() ||
                    ShipShield() != ShipShield_Off
                ) &&

                // Game session cancel (disabled): If change to weapon that is not Bomb
                // Game session cancel (disabled): If not Bomb once in Area 12
                disable_when(
                    CurrentWeapon() != CurrentWeapon_Bomb &&
                    (
                        CurrentWeapon() != prev(CurrentWeapon()) ||
                        MapSection() >= 6
                    )
                ) &&

                // Start event (checkpoint): We reach Final Boss location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x28 &&
                    MapSectionOffset() == 0x080
                ) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When we reach SlapNet, game scroll pauses at section offset 0x0df
                // Once destroyed, game scroll resumes increasing the offset
                trigger_when(MapSection() == 0x28) && 
                trigger_when(MapSectionOffset() == 0x0E0) && 
              
                // Alt groups: Reset hits when game start
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Terminate SlapNet - Laser Only", points = 25,
    description = "Get Laser before Area 12 and destroy SlapNet. From Area 12 up, don't ever change to a weapon other than Laser and don't be killed. Never use Shield. Zero points cheat not allowed.",
    id = 390963, badge = "441931", published = "20/01/2024 10:03:38", modified = "20/01/2024 10:03:38",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                // Game session cancel (disabled): If shield is activated
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints() ||
                    ShipShield() != ShipShield_Off
                ) &&

                // Game session cancel (disabled): If change to weapon that is not Laser
                // Game session cancel (disabled): If not Laser once in Area 12
                disable_when(
                    CurrentWeapon() != CurrentWeapon_Laser &&
                    (
                        CurrentWeapon() != prev(CurrentWeapon()) ||
                        MapSection() >= 6
                    )
                ) &&

                // Start event (checkpoint): We reach Final Boss location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x28 &&
                    MapSectionOffset() == 0x080
                ) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When we reach SlapNet, game scroll pauses at section offset 0x0df
                // Once destroyed, game scroll resumes increasing the offset
                trigger_when(MapSection() == 0x28) && 
                trigger_when(MapSectionOffset() == 0x0E0) && 
              
                // Alt groups: Reset hits when game start
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Terminate SlapNet - H.Mis. Only", points = 50,
    description = "Get H.Mis. before Area 12 and destroy SlapNet. From Area 12 up, don't ever change to a weapon other than H.Mis. and don't be killed. Never use Shield. Zero points cheat not allowed.",
    id = 390964, badge = "441932", published = "20/01/2024 10:03:39", modified = "20/01/2024 10:03:39",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                // Game session cancel (disabled): If shield is activated
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints() ||
                    ShipShield() != ShipShield_Off
                ) &&

                // Game session cancel (disabled): If change to weapon that is not H.Mis.
                // Game session cancel (disabled): If not H.Mis. once in Area 12
                disable_when(
                    CurrentWeapon() != CurrentWeapon_HM &&
                    (
                        CurrentWeapon() != prev(CurrentWeapon()) ||
                        MapSection() >= 6
                    )
                ) &&

                // Start event (checkpoint): We reach Final Boss location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x28 &&
                    MapSectionOffset() == 0x080
                ) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When we reach SlapNet, game scroll pauses at section offset 0x0df
                // Once destroyed, game scroll resumes increasing the offset
                trigger_when(MapSection() == 0x28) && 
                trigger_when(MapSectionOffset() == 0x0E0) && 
              
                // Alt groups: Reset hits when game start
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Terminate SlapNet - Bomb Only Lite", points = 10,
    description = "Get Bomb between Areas 46 and 55, both included, and destroy SlapNet. From the moment you get Bomb on, don't change weapon, don't use Shield, and don't be killed. Don't change to a weapon other than Bomb from Area 46 on. Zero points cheat not allowed.",
    id = 390939, badge = "441881", published = "20/01/2024 10:02:23", modified = "20/01/2024 10:02:23",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints()
                ) &&

                // Game session cancel (disabled): If change to weapon that is not Bomb from Area 46 up
                disable_when(
                    MapSection() >= 0x17 &&
                    CurrentWeapon() != prev(CurrentWeapon()) &&
                    CurrentWeapon() != 1
                 ) &&

                // Game session cancel (disabled): If not Bomb once in Area 56
                disable_when(
                    MapSection() >= 0x1C &&
                    CurrentWeapon() != 1
                ) &&

                // Game session cancel (disabled): If shield is activated from Area 46 up
                disable_when(
                    MapSection() >= 0x17 &&
                    ShipShield() != ShipShield_Off
                ) &&

                // Start event (checkpoint): We reach Final Boss location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x28 &&
                    MapSectionOffset() == 0x080
                ) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When we reach SlapNet, game scroll pauses at section offset 0x0df
                // Once destroyed, game scroll resumes increasing the offset
                trigger_when(MapSection() == 0x28) && 
                trigger_when(MapSectionOffset() == 0x0E0) && 
              
                // Alt groups: Reset hits when game start
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Terminate SlapNet - Laser Only Lite", points = 10,
    description = "Get Laser between Areas 46 and 55, both included, and destroy SlapNet. From the moment you get Laser on, don't change weapon, don't use Shield, and don't be killed. Don't change to a weapon other than Laser from Area 46 on. Zero points cheat not allowed.",
    id = 390957, badge = "441916", published = "20/01/2024 10:03:15", modified = "20/01/2024 10:03:15",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints()
                ) &&

                // Game session cancel (disabled): If change to weapon that is not Laser from Area 46 up
                disable_when(
                    MapSection() >= 0x17 &&
                    CurrentWeapon() != prev(CurrentWeapon()) &&
                    CurrentWeapon() != 2
                 ) &&

                // Game session cancel (disabled): If not Laser once in Area 56
                disable_when(
                    MapSection() >= 0x1C &&
                    CurrentWeapon() != 2
                ) &&

                // Game session cancel (disabled): If shield is activated from Area 46 up
                disable_when(
                    MapSection() >= 0x17 &&
                    ShipShield() != ShipShield_Off
                ) &&

                // Start event (checkpoint): We reach Final Boss location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x28 &&
                    MapSectionOffset() == 0x080
                ) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When we reach SlapNet, game scroll pauses at section offset 0x0df
                // Once destroyed, game scroll resumes increasing the offset
                trigger_when(MapSection() == 0x28) && 
                trigger_when(MapSectionOffset() == 0x0E0) && 
              
                // Alt groups: Reset hits when game start
                ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Terminate SlapNet - H.Mis. Only Lite", points = 25,
    description = "Get H.Mis. between Areas 46 and 55, both included, and destroy SlapNet. From the moment you get H.Mis. on, don't change weapon, don't use Shield, and don't be killed. Don't change to a weapon other than H.Mis. from Area 46 on. Zero points cheat not allowe",
    id = 390940, badge = "441885", published = "20/01/2024 10:02:23", modified = "20/01/2024 10:02:23",
    trigger =   // Prevent hits outside 1P Game
                // Game session cancel (disabled): If zero points cheat
                disable_when(
                    GameMode() != GameMode_1PGame ||
                    DeadWithZeroPoints()
                ) &&

                // Game session cancel (disabled): If change to weapon that is not H.Mis. from Area 46 up
                disable_when(
                    MapSection() >= 0x17 &&
                    CurrentWeapon() != prev(CurrentWeapon()) &&
                    CurrentWeapon() != CurrentWeapon_HM
                 ) &&

                // Game session cancel (disabled): If not H.Mis. once in Area 56
                disable_when(
                    MapSection() >= 0x1C &&
                    CurrentWeapon() != CurrentWeapon_HM
                ) &&

                // Game session cancel (disabled): If shield is activated from Area 46 up
                disable_when(
                    MapSection() >= 0x17 &&
                    ShipShield() != ShipShield_Off
                ) &&

                // Start event (checkpoint): We reach Final Boss location
                once(
                    C0B0_Protection() &&
                    MapSection() == 0x28 &&
                    MapSectionOffset() == 0x080
                ) &&

                // Game Settings Checks
                GameSettingsCheck() &&

                // Trigger: When we reach SlapNet, game scroll pauses at section offset 0x0df
                // Once destroyed, game scroll resumes increasing the offset
                trigger_when(MapSection() == 0x28) && 
                trigger_when(MapSectionOffset() == 0x0E0) && 
              
                // Alt groups: Reset hits when game start
                ResetHitsOnGameStart_uniqueAlt()
)


// *******************************************************************************************
// * "Reachy" Achievements
// *******************************************************************************************
achievement(
    title = "Whole Slappa Points", points = 25,
    description = "Score 400000 points in the first loop. Zero points cheat not allowed.",
    id = 390918, badge = "441847", published = "20/01/2024 10:02:17", modified = "20/01/2024 10:02:17",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints()
              ) &&

              // Start event (checkpoint): We reached 380000 points
              once(
                  (prev(ThousandPoints()) < 380) &&
                  ThousandPoints() >= 380
              ) &&

              // Game Settings Checks
              GameSettingsCheck() &&

              IsFirstLoop() &&
              trigger_when(ThousandPoints() >= 400) &&

              // Alt groups: Reset hits when game start
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Area 255", points = 50,
    description = "Complete the first three loops, crossing the loop border after destroying SlapNet in the third loop. Zero points cheat not allowed.",
    id = 390944, badge = "441901", published = "20/01/2024 10:02:24", modified = "20/01/2024 10:02:24",
    trigger = // Prevent hits outside 1P Game
              // Game session cancel (disabled): If zero points cheat
              disable_when(
                  GameMode() != GameMode_1PGame ||
                  DeadWithZeroPoints()
              ) &&

              // Start event (checkpoint): We show the icon when facing SlapNet in Loop 3
              once(
                  IsThirdLoop() &&
                  C0B0_Protection() &&
                  MapSection() == 0x28 &&
                  MapSectionOffset() == 0x80
              ) &&

              // Cancel: If the ship is destroyed
              never(
                  prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                  ShipDestructionCounter() == ShipDestruction_LastFrame
              ) &&
               
              // Game Settings Checks 
              GameSettingsCheck() &&

              LoopCounterBit4() == 0 &&
              trigger_when(prev(LoopCounterLow4()) == 2) &&
              trigger_when(LoopCounterLow4() == 3) &&

              // Alt groups: Reset hits when game start
              ResetHitsOnGameStart_uniqueAlt()
)


// *******************************************************************************************
// * Zero Points Cheat: "The Conscientious Objector", documentary film about Desmond Doss    *
// *******************************************************************************************
achievement(
    title = "The Conscientious Objector", points = 1,
    description = "Zero points cheat - Before Area 6. Get killed without scoring points before Area 6 and see what happens. Area 6 starts when the round Fountain is slightly below the center of the screen.",
    id = 390970, badge = "441938", published = "20/01/2024 10:03:40", modified = "20/01/2024 10:03:40",
    trigger = // Game Settings Checks
              GameSettingsCheck() &&

              // Trigger: Died with 0 points and before Area 3
              GameMode() == GameMode_1PGame &&
              DeadWithZeroPoints() &&
              DeadWith0PBeforeArea3()              
)

achievement(
    title = "The Conscientious Objector: Round Fountain", points = 2,
    description = "Zero points cheat - Area 6. Get killed without scoring points within Area 6 or 7, and see what happens.",
    id = 390943, badge = "441897", published = "20/01/2024 10:02:24", modified = "20/01/2024 10:02:24",
    trigger = // Game Settings Checks 
              GameSettingsCheck() &&

              GameMode() == GameMode_1PGame &&                                     // 1P Game mode
              MapSection() == 3 &&                                                 // Section 3, Areas 6 and 7
              prev(ShipDestructionCounter()) == ShipDestruction_AntePenUltFrame && // Little scroll time after the destruction of the ship
              ShipDestructionCounter() == ShipDestruction_PenUltFrame &&           
              Player1ScoreTensChar() == BlankScreenChar                                       // No tens of points: 0 points
)

achievement(
    title = "The Conscientious Objector: Subway Stairs", points = 3,
    description = "Zero points cheat - Area 8. Get killed without scoring points within Area 8 or 9, and see what happens. Area 8 starts when the subway stairs are at the center of the screen.",
    id = 390961, badge = "441927", published = "20/01/2024 10:03:17", modified = "20/01/2024 10:03:17",
    trigger = // Game Settings Checks
              GameSettingsCheck() &&
              
              GameMode() == GameMode_1PGame &&                                     // 1P Game mode
              MapSection() == 4 &&                                                 // Section 4, Areas 8 and 9
              prev(ShipDestructionCounter()) == ShipDestruction_AntePenUltFrame && // Little scroll time after the destruction of the ship
              ShipDestructionCounter() == ShipDestruction_PenUltFrame &&
              Player1ScoreTensChar() == BlankScreenChar                                       // No tens of points: 0 points
)

achievement(
    title = "The Conscientious Objector: Rampart Shadow", points = 5,
    description = "Zero points cheat - Area 10. Get killed without scoring points within Area 10 or 11, and see what happens. Area 10 starts when the shadows of the rampart are just at the top of the screen.",
    id = 390971, badge = "441939", published = "20/01/2024 10:03:40", modified = "20/01/2024 10:03:40",
    trigger = // Game Settings Checks
              GameSettingsCheck() &&
              
              GameMode() == GameMode_1PGame &&                                     // 1P Game mode
              MapSection() == 5 &&                                                 // Section 5, Areas 10 and 11
              prev(ShipDestructionCounter()) == ShipDestruction_AntePenUltFrame && // Little scroll time after the destruction of the ship
              ShipDestructionCounter() == ShipDestruction_PenUltFrame &&
              Player1ScoreTensChar() == BlankScreenChar                                       // No tens of points: 0 points
)

achievement(
    title = "The Conscientious Objector: Squared Towers Matrix", points = 10,
    description = "Zero points cheat - Area 12. Get killed without scoring points from Area 12 upwards, and see what happens. Area 12 starts when half the second row of square towers is seen at the top of the screen.",
    id = 390972, badge = "441940", published = "20/01/2024 10:03:40", modified = "20/01/2024 10:03:40",
    trigger = // Game Settings Checks
              GameSettingsCheck() &&
              
              GameMode() == GameMode_1PGame &&                                     // 1P Game mode
              MapSection() >= 6 &&                                               // Section 6, Area 12 upwards
              prev(ShipDestructionCounter()) == ShipDestruction_AntePenUltFrame && // Little scroll time after the destruction of the ship
              ShipDestructionCounter() == ShipDestruction_PenUltFrame &&
              Player1ScoreTensChar() == BlankScreenChar                                       // No tens of points: 0 points
)


// *******************************************************************************************
// * Weapon-based Bonuses
// *******************************************************************************************
achievement(
    title = "Challenge: Shotty Hunter", points = 10,
    description = "Try and collect the 4 hidden bonus available with Shot weapon in any one loop. You must not be killed once the first shot bonus is collected.",
    id = 390958, badge = "457957", published = "20/01/2024 10:03:16", modified = "20/01/2024 10:03:16",
    trigger = // Prevent tally from counting hits outside 1P Game
              disable_when(GameMode() != GameMode_1PGame) &&

              // Start event (checkpoint): reaching the first Shot Bonus
              once(
                  C0B0_Protection() &&
                  MapSection() == 0x0D &&
                  MapSectionOffset() == 0x1C0
              ) && 

              // Problem: Shot bonus won't appear if player has 5 or more remaining lives, 6 or more counting current life.
              // Cancel: If one life is lost
              never(
                  prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                  ShipDestructionCounter() == ShipDestruction_LastFrame
              ) &&

              // Cancel: Reset all after getting by last shot bonus
              never(
                  MapSection() == 0x20 &&
                  MapSectionOffset() == 0x1FD
              ) &&

              // Game Settings Checks 
              GameSettingsCheck() &&

              // Important: Shot Bonus won't appear if player has 6 life's or more
              // This affect mainly the second Shot Bonus 
              measured(tally(4, 
                  UpdateRoutinePtr(SpriteEntry00) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry00)) == 0 && SpritePoints(SpriteEntry00) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry01) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry01)) == 0 && SpritePoints(SpriteEntry01) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry02) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry02)) == 0 && SpritePoints(SpriteEntry02) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry03) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry03)) == 0 && SpritePoints(SpriteEntry03) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry04) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry04)) == 0 && SpritePoints(SpriteEntry04) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry05) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry05)) == 0 && SpritePoints(SpriteEntry05) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry06) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry06)) == 0 && SpritePoints(SpriteEntry06) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry07) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry07)) == 0 && SpritePoints(SpriteEntry07) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry08) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry08)) == 0 && SpritePoints(SpriteEntry08) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry09) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry09)) == 0 && SpritePoints(SpriteEntry09) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry0a) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry0a)) == 0 && SpritePoints(SpriteEntry0a) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry0b) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry0b)) == 0 && SpritePoints(SpriteEntry0b) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry0c) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry0c)) == 0 && SpritePoints(SpriteEntry0c) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry0d) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry0d)) == 0 && SpritePoints(SpriteEntry0d) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry0e) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry0e)) == 0 && SpritePoints(SpriteEntry0e) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry0f) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry0f)) == 0 && SpritePoints(SpriteEntry0f) == LittleInvader_PointsAfterFirstHit, 
                  UpdateRoutinePtr(SpriteEntry00) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry00)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry00),
                  UpdateRoutinePtr(SpriteEntry01) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry01)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry01),
                  UpdateRoutinePtr(SpriteEntry02) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry02)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry02),
                  UpdateRoutinePtr(SpriteEntry03) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry03)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry03),
                  UpdateRoutinePtr(SpriteEntry04) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry04)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry04),
                  UpdateRoutinePtr(SpriteEntry05) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry05)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry05),
                  UpdateRoutinePtr(SpriteEntry06) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry06)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry06),
                  UpdateRoutinePtr(SpriteEntry07) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry07)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry07),
                  UpdateRoutinePtr(SpriteEntry08) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry08)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry08),
                  UpdateRoutinePtr(SpriteEntry09) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry09)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry09),
                  UpdateRoutinePtr(SpriteEntry0a) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0a)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry0a),
                  UpdateRoutinePtr(SpriteEntry0b) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0b)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry0b),
                  UpdateRoutinePtr(SpriteEntry0c) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0c)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry0c),
                  UpdateRoutinePtr(SpriteEntry0d) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0d)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry0d),
                  UpdateRoutinePtr(SpriteEntry0e) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0e)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry0e),
                  UpdateRoutinePtr(SpriteEntry0f) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0f)) == Shotty_Skin_QuestionMark && Shotty_Skin_AnyConsumed(SpriteEntry0f)
              )) &&

              // Alt: Reset all on game start
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Milk the Little Invader", points = 25,
    description = "Try and get 30000 points from any one hidden Little Invader",
    id = 390965, badge = "441933", published = "20/01/2024 10:03:39", modified = "20/01/2024 10:03:39",
    trigger = // Game Settings Checks 
              GameSettingsCheck() &&

              GameMode() == GameMode_1PGame &&
              (
                   UpdateRoutinePtr(SpriteEntry00) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry00)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry00) == LittleInvader_30KPoints_LastScore ||
                   UpdateRoutinePtr(SpriteEntry01) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry01)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry01) == LittleInvader_30KPoints_LastScore ||
                   UpdateRoutinePtr(SpriteEntry02) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry02)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry02) == LittleInvader_30KPoints_LastScore ||
                   UpdateRoutinePtr(SpriteEntry03) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry03)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry03) == LittleInvader_30KPoints_LastScore ||
                   UpdateRoutinePtr(SpriteEntry04) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry04)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry04) == LittleInvader_30KPoints_LastScore ||
                   UpdateRoutinePtr(SpriteEntry05) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry05)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry05) == LittleInvader_30KPoints_LastScore ||
                   UpdateRoutinePtr(SpriteEntry06) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry06)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry06) == LittleInvader_30KPoints_LastScore ||
                   UpdateRoutinePtr(SpriteEntry07) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry07)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry07) == LittleInvader_30KPoints_LastScore ||
                   UpdateRoutinePtr(SpriteEntry08) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry08)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry08) == LittleInvader_30KPoints_LastScore ||
                   UpdateRoutinePtr(SpriteEntry09) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry09)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry09) == LittleInvader_30KPoints_LastScore ||
                   UpdateRoutinePtr(SpriteEntry0a) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry0a)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry0a) == LittleInvader_30KPoints_LastScore ||
                   UpdateRoutinePtr(SpriteEntry0b) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry0b)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry0b) == LittleInvader_30KPoints_LastScore ||
                   UpdateRoutinePtr(SpriteEntry0c) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry0c)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry0c) == LittleInvader_30KPoints_LastScore ||
                   UpdateRoutinePtr(SpriteEntry0d) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry0d)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry0d) == LittleInvader_30KPoints_LastScore ||
                   UpdateRoutinePtr(SpriteEntry0e) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry0e)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry0e) == LittleInvader_30KPoints_LastScore ||
                   UpdateRoutinePtr(SpriteEntry0f) == LittleInvader_UpdateRoutinePtr && prev(SpritePoints(SpriteEntry0f)) == LittleInvader_30KPoints_PenUltScore && SpritePoints(SpriteEntry0f) == LittleInvader_30KPoints_LastScore
              )
)

achievement(
    title = "Challenge: Boomba Secrets", points = 25,
    description = "Try and discover all hidden Bomb targets in any one loop. You must not be killed once approaching the first target.",
    id = 390941, badge = "441888", published = "20/01/2024 10:02:23", modified = "20/01/2024 10:02:23",
    trigger = // Prevent tally from counting hits outside 1P Game
              disable_when(GameMode() != GameMode_1PGame) &&

              // Start event (checkpoint): reaching the first Shot Bonus
              once(
                  C0B0_Protection() &&
                  MapSection() == 0x05 &&
                  MapSectionOffset() == 0x180
              ) && 

              // Cancel: If one life is lost
              never(
                  prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                  ShipDestructionCounter() == ShipDestruction_LastFrame
              ) &&

              // Cancel: Reset all after getting by last bomb target
              never(
                  MapSection() == 0x23 &&
                  MapSectionOffset() == 0x0E1
              ) &&

              // Game Settings Checks 
              GameSettingsCheck() &&

              // 0x506c, 0xEE: Destroyable roof
              // 0x4d18, 0x03: Hidden Tree
              measured(tally(35, 
                  SpriteCode(SpriteEntry00) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry00) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry00)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry00) == Roof_ExplosionCounter_LastFrame, 
                  SpriteCode(SpriteEntry01) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry01) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry01)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry01) == Roof_ExplosionCounter_LastFrame, 
                  SpriteCode(SpriteEntry02) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry02) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry02)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry02) == Roof_ExplosionCounter_LastFrame, 
                  SpriteCode(SpriteEntry03) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry03) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry03)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry03) == Roof_ExplosionCounter_LastFrame, 
                  SpriteCode(SpriteEntry04) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry04) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry04)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry04) == Roof_ExplosionCounter_LastFrame, 
                  SpriteCode(SpriteEntry05) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry05) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry05)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry05) == Roof_ExplosionCounter_LastFrame, 
                  SpriteCode(SpriteEntry06) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry06) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry06)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry06) == Roof_ExplosionCounter_LastFrame, 
                  SpriteCode(SpriteEntry07) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry07) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry07)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry07) == Roof_ExplosionCounter_LastFrame, 
                  SpriteCode(SpriteEntry08) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry08) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry08)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry08) == Roof_ExplosionCounter_LastFrame, 
                  SpriteCode(SpriteEntry09) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry09) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry09)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry09) == Roof_ExplosionCounter_LastFrame, 
                  SpriteCode(SpriteEntry0a) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry0a) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry0a)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry0a) == Roof_ExplosionCounter_LastFrame, 
                  SpriteCode(SpriteEntry0b) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry0b) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry0b)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry0b) == Roof_ExplosionCounter_LastFrame, 
                  SpriteCode(SpriteEntry0c) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry0c) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry0c)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry0c) == Roof_ExplosionCounter_LastFrame, 
                  SpriteCode(SpriteEntry0d) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry0d) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry0d)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry0d) == Roof_ExplosionCounter_LastFrame, 
                  SpriteCode(SpriteEntry0e) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry0e) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry0e)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry0e) == Roof_ExplosionCounter_LastFrame, 
                  SpriteCode(SpriteEntry0f) == Roof_SpriteCode && UpdateRoutinePtr(SpriteEntry0f) == Roof_UpdateRoutinePtr && prev(Roof_ExplosionCounter(SpriteEntry0f)) == Roof_ExplosionCounter_PenUltFrame && Roof_ExplosionCounter(SpriteEntry0f) == Roof_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry00) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry00) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry00)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry00) == Tree_AnimationCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry01) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry01) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry01)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry01) == Tree_AnimationCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry02) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry02) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry02)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry02) == Tree_AnimationCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry03) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry03) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry03)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry03) == Tree_AnimationCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry04) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry04) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry04)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry04) == Tree_AnimationCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry05) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry05) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry05)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry05) == Tree_AnimationCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry06) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry06) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry06)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry06) == Tree_AnimationCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry07) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry07) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry07)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry07) == Tree_AnimationCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry08) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry08) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry08)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry08) == Tree_AnimationCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry09) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry09) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry09)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry09) == Tree_AnimationCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0a) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry0a) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry0a)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry0a) == Tree_AnimationCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0b) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry0b) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry0b)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry0b) == Tree_AnimationCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0c) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry0c) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry0c)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry0c) == Tree_AnimationCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0d) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry0d) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry0d)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry0d) == Tree_AnimationCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0e) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry0e) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry0e)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry0e) == Tree_AnimationCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0f) == Tree_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry0f) == Tree_Points && prev(Tree_AnimationCounter(SpriteEntry0f)) == Tree_AnimationCounter_PenUltFrame && Tree_AnimationCounter(SpriteEntry0f) == Tree_AnimationCounter_LastFrame
              )) &&

              // Alt: Reset all on game start
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Last Rail to Slapcentral", points = 10,
    description = "Try and destroy all those destroyable lattice rail segments in any one loop. You must not be killed between the first and last rails.",
    id = 390966, badge = "441934", published = "20/01/2024 10:03:39", modified = "20/01/2024 10:03:39",
    trigger = // Prevent tally from counting hits outside 1P Game
              disable_when(GameMode() != GameMode_1PGame) &&

              // Start event (checkpoint): reaching the first lattice rails
              once(
                  C0B0_Protection() &&
                  MapSection() == 0x15 &&
                  MapSectionOffset() == 0x1E8
              ) && 

              // Cancel: If one life is lost
              never(
                  prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                  ShipDestructionCounter() == ShipDestruction_LastFrame
              ) &&

              // Reset all after leaving rails behind
              never(
                  MapSection() == 0x1C &&
                  MapSectionOffset() == 0x150
              ) &&

              // Game Settings Checks 
              GameSettingsCheck() &&

              measured(tally(31, 
                  UpdateRoutinePtr(SpriteEntry00) == Rail_UpdateRoutinePtr && byte(SpriteEntry00 + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry00)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry00) == Rail_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry01) == Rail_UpdateRoutinePtr && byte(SpriteEntry01 + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry01)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry01) == Rail_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry02) == Rail_UpdateRoutinePtr && byte(SpriteEntry02 + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry02)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry02) == Rail_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry03) == Rail_UpdateRoutinePtr && byte(SpriteEntry03 + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry03)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry03) == Rail_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry04) == Rail_UpdateRoutinePtr && byte(SpriteEntry04 + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry04)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry04) == Rail_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry05) == Rail_UpdateRoutinePtr && byte(SpriteEntry05 + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry05)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry05) == Rail_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry06) == Rail_UpdateRoutinePtr && byte(SpriteEntry06 + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry06)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry06) == Rail_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry07) == Rail_UpdateRoutinePtr && byte(SpriteEntry07 + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry07)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry07) == Rail_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry08) == Rail_UpdateRoutinePtr && byte(SpriteEntry08 + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry08)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry08) == Rail_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry09) == Rail_UpdateRoutinePtr && byte(SpriteEntry09 + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry09)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry09) == Rail_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0a) == Rail_UpdateRoutinePtr && byte(SpriteEntry0a + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry0a)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry0a) == Rail_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0b) == Rail_UpdateRoutinePtr && byte(SpriteEntry0b + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry0b)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry0b) == Rail_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0c) == Rail_UpdateRoutinePtr && byte(SpriteEntry0c + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry0c)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry0c) == Rail_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0d) == Rail_UpdateRoutinePtr && byte(SpriteEntry0d + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry0d)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry0d) == Rail_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0e) == Rail_UpdateRoutinePtr && byte(SpriteEntry0e + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry0e)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry0e) == Rail_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0f) == Rail_UpdateRoutinePtr && byte(SpriteEntry0f + 0x1C) == Rail_Points && prev(Rail_ExplosionCounter(SpriteEntry0f)) == Rail_ExplosionCounter_PenUltFrame && Rail_ExplosionCounter(SpriteEntry0f) == Rail_ExplosionCounter_LastFrame
              )) &&

              // Alt: Reset all on game start
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Green Plastic Lasering Can", points = 50,
    description = "Try and fully grow all laser feeding plants in any one loop. You must not be killed between the first and last plants.",
    id = 390967, badge = "441935", published = "20/01/2024 10:03:39", modified = "20/01/2024 10:03:39",
    trigger = // Prevent tally from counting hits outside 1P Game
              disable_when(GameMode() != GameMode_1PGame) &&

              // Start event (checkpoint): reaching the first laser plant
              once(
                  C0B0_Protection() &&
                  MapSection() == 0x0e &&
                  MapSectionOffset() == 0x090
              ) && 

              // Cancel: If one life is lost
              never(
                  prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                  ShipDestructionCounter() == ShipDestruction_LastFrame
              ) &&

              // Reset all after leaving the last plants behind
              never(
                  MapSection() == 0x23 &&
                  MapSectionOffset() == 0x159
              ) &&

              // Game Settings Checks
              GameSettingsCheck() &&

              measured(tally(10, 
                  UpdateRoutinePtr(SpriteEntry00) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry00)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry00) == Plant_GrowthCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry01) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry01)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry01) == Plant_GrowthCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry02) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry02)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry02) == Plant_GrowthCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry03) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry03)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry03) == Plant_GrowthCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry04) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry04)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry04) == Plant_GrowthCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry05) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry05)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry05) == Plant_GrowthCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry06) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry06)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry06) == Plant_GrowthCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry07) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry07)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry07) == Plant_GrowthCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry08) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry08)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry08) == Plant_GrowthCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry09) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry09)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry09) == Plant_GrowthCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0a) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry0a)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry0a) == Plant_GrowthCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0b) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry0b)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry0b) == Plant_GrowthCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0c) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry0c)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry0c) == Plant_GrowthCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0d) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry0d)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry0d) == Plant_GrowthCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0e) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry0e)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry0e) == Plant_GrowthCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0f) == Plant_UpdateRoutinePtr && prev(Plant_GrowthCounter(SpriteEntry0f)) == Plant_GrowthCounter_PenUltFrame && Plant_GrowthCounter(SpriteEntry0f) == Plant_GrowthCounter_LastFrame
              )) &&

              // Alt: Reset all on game start
              ResetHitsOnGameStart_uniqueAlt()
)

achievement(
    title = "Challenge: Flippy Flippy Bang Bang", points = 50,
    description = "Try and destroy the 56 hidden home missile deflectors in any one loop. You must not be killed, unless you do with zero points.",
    id = 390959, badge = "441922", published = "20/01/2024 10:03:16", modified = "20/01/2024 10:03:16",
    trigger = // Prevent tally from counting hits outside 1P Game
              disable_when(GameMode() != GameMode_1PGame) &&

              // Game session cancel (disabled): If one life is lost
              // and score > 0.
              disable_when(
                  prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                  ShipDestructionCounter() == ShipDestruction_LastFrame &&
                  Player1ScoreTensChar() != BlankScreenChar
              ) &&

              // Game Settings Checks 
              GameSettingsCheck() &&

              measured(tally(56, 
                  UpdateRoutinePtr(SpriteEntry00) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry00) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry00)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry00) == Deflector_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry01) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry01) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry01)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry01) == Deflector_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry02) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry02) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry02)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry02) == Deflector_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry03) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry03) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry03)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry03) == Deflector_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry04) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry04) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry04)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry04) == Deflector_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry05) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry05) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry05)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry05) == Deflector_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry06) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry06) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry06)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry06) == Deflector_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry07) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry07) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry07)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry07) == Deflector_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry08) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry08) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry08)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry08) == Deflector_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry09) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry09) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry09)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry09) == Deflector_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0a) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry0a) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry0a)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry0a) == Deflector_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0b) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry0b) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry0b)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry0b) == Deflector_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0c) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry0c) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry0c)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry0c) == Deflector_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0d) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry0d) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry0d)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry0d) == Deflector_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0e) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry0e) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry0e)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry0e) == Deflector_ExplosionCounter_LastFrame, 
                  UpdateRoutinePtr(SpriteEntry0f) == Deflector_UpdateRoutinePtr && SpritePointsLow8(SpriteEntry0f) == Deflector_Points && prev(Deflector_ExplosionCounter(SpriteEntry0f)) == Deflector_ExplosionCounter_PenUltFrame && Deflector_ExplosionCounter(SpriteEntry0f) == Deflector_ExplosionCounter_LastFrame
              )) &&

              (
                  // Reset all on game start
                  never(prev(GameMode()) != GameMode_1PGame && GameMode() == GameMode_1PGame) ||
                  // Reset all hits on loop completion
                  never(
                      LoopCounter() > prev(LoopCounter())
                  )
              )
)

// Shot Bonus:
//              +00  +03  +06  +1c
//  Activation:  03 - 80 - 94 - 00  -> Codigo 0x03: ?
//  1st hit:
//  2nd hit:     3c - 86 - 00 - up  -> Codigo 0x3c: 3000 points
//  Touch:       3d - 80 - 00 - up  -> Codigo 0x3d: 1up
achievement(
    title = "Challenge: Beam Me Up, Shotty", points = 10,
    description = "Try and get 70000 points from any one hidden shot bonus.",
    trigger = // Game Settings Checks 
              GameSettingsCheck() &&

              // TODO: Add trigger_when, but it isn't easy
              //  The best moment is when the question mark sprite is shown, 
              //  but the sprite entry isn't involved: It's just a matter of calling a routine.
              //  Is the slot control data that is modified, but entry i isn't always controlled by slot control data i.
              GameMode() == GameMode_1PGame &&
              CompanionShipOnScreen() &&
              ScoreUpdate() - prev(ScoreUpdate()) == 0x7000 &&
              // Sprite change from ? to 1up
              (
                   UpdateRoutinePtr(SpriteEntry00) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry00)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry00) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry01) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry01)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry01) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry02) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry02)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry02) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry03) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry03)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry03) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry04) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry04)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry04) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry05) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry05)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry05) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry06) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry06)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry06) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry07) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry07)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry07) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry08) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry08)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry08) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry09) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry09)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry09) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry0a) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0a)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry0a) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry0b) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0b)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry0b) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry0c) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0c)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry0c) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry0d) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0d)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry0d) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry0e) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0e)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry0e) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry0f) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0f)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry0f) == Shotty_Skin_1UP
              )
)

achievement(
    title = "Challenge: Life Me Up, Shotty", points = 5,
    description = "Try and get one extra life from any one hidden shot bonus.",
    trigger = // Game Settings Checks 
              GameSettingsCheck() &&

              // TODO: Add trigger_when, but it isn't easy
              GameMode() == GameMode_1PGame &&
              //LivesRemaining() > prev(LivesRemaining()) &&
              // Sprite change from ? to 1up
              (
                   UpdateRoutinePtr(SpriteEntry00) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry00)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry00) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry01) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry01)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry01) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry02) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry02)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry02) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry03) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry03)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry03) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry04) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry04)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry04) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry05) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry05)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry05) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry06) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry06)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry06) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry07) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry07)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry07) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry08) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry08)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry08) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry09) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry09)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry09) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry0a) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0a)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry0a) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry0b) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0b)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry0b) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry0c) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0c)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry0c) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry0d) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0d)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry0d) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry0e) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0e)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry0e) == Shotty_Skin_1UP ||
                   UpdateRoutinePtr(SpriteEntry0f) == Shotty_UpdateRoutinePtr && prev(SpriteCode(SpriteEntry0f)) == Shotty_Skin_QuestionMark && SpriteCode(SpriteEntry0f) == Shotty_Skin_1UP
              )
)


// *******************************************************************************************
// * Companion Ship
// *******************************************************************************************
achievement(
    title = "You'll Never Walk Alone", points = 10,
    description = "Get a funny companion ship. But, how does one get it?",
    id = 390960, badge = "441924", published = "20/01/2024 10:03:16", modified = "20/01/2024 10:03:16",
    trigger = // Game Settings Checks
              GameSettingsCheck() &&

              // 1P Game Check
              GameMode() == GameMode_1PGame &&
              CompanionShipOnScreen() &&

              (
                  CompanionShipSkin() == CompanionShipSkin_A ||
                  CompanionShipSkin() == CompanionShipSkin_B
              )
)

achievement(
    title = "In the Variety Is the Spice", points = 25,
    description = "Be lucky enough to get both kinds of funny companion ship during a game.",
    id = 390969, badge = "441937", published = "20/01/2024 10:03:40", modified = "20/01/2024 10:03:40",
    trigger = // Game Settings Checks 
              GameSettingsCheck() &&

              once(
                  GameMode() == GameMode_1PGame &&
                  
                  // We wait until the companion skin 0x01 appears to trigger
                  CompanionShipOnScreen() &&
                  CompanionShipSkin() == CompanionShipSkin_A
              ) &&

              once(
                  GameMode() == GameMode_1PGame &&
                  // We wait until the companion skin 0xe7 appears to trigger
                  CompanionShipOnScreen() &&
                  CompanionShipSkin() == CompanionShipSkin_B) &&

              // Reset hits on game start
              never(
                  prev(GameMode()) != GameMode_1PGame &&
                  GameMode() == GameMode_1PGame
              )
)


// *******************************************************************************************
// * Leaderboards
// *******************************************************************************************
leaderboard(
    id = 87410, title = "Excellent Players",
    description = "Highest score. Zero points cheat not allowed. Game settings for all leaderboards: 1 Player game, 3 lives, medium difficulty, 30K 100K bonus life",
    start  =    GameSettingsCheck() &&
                prev(GameMode()) == GameMode_1PGame &&
                GameMode() == GameMode_1PGameOver,
    cancel =    // Cancel game session if ZP cheat
                once(DeadWithZeroPoints()) &&
                // Alt group: Eventualy reset ZP cheat hit at 1P game start
                ResetHitsOnGameStart(),
    submit =    always_true(),
    value =     Score(),
    format =    "SCORE"
)

leaderboard(
    id = 87412, title = "Excellent Players - Shot Only",
    description = "Highest score never using a weapon but Shot, nor Shield. Zero points cheat not allowed.",
    start  =    GameSettingsCheck() &&
                prev(GameMode()) == GameMode_1PGame && GameMode() == GameMode_1PGameOver,
    cancel = always_true() &&
             (   // Cancel: If we ever use the Shield
                 once(ShipShield() != ShipShield_Off) ||
                 // Cancel: If we ever use a weapon that is not Shot
                 once(CurrentWeapon() != CurrentWeapon_Shot) ||
                 // Cancel: If we perform the 0 Points Cheat
                 once(DeadWithZeroPoints()) ||
                 // We reset previous hits at game start
                 ResetHitsOnGameStart_Alt()
             ),
    submit = always_true(),
    value = Score(),
    format = "SCORE"
)

leaderboard(
    id = 87411, title = "Excellent Players - First Life",
    description = "Highest score on very first life.",
    start  =    GameSettingsCheck() &&
                GameMode() == GameMode_1PGame &&
                prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                ShipDestructionCounter() == ShipDestruction_LastFrame &&
                // No submit if zero points
                Player1ScoreTensChar() != BlankScreenChar,
    cancel =    // We prevent LB to start one whe lose the first life,
                // which will be the second decrease of the variable
                repeated(2, prev(LivesRemaining()) > LivesRemaining()) &&
                // Alt group: Reset previous hits at game start
                ResetHitsOnGameStart(),
    submit =    always_true(),
    value =     Score(),
    format =    "SCORE"
)

leaderboard(
    id = 87417, title = "Excellent Players - First Life, Shot Only",
    description = "Highest score on very first life never using a weapon but Shot, nor Shield.",
    start  =    GameSettingsCheck() &&
                GameMode() == GameMode_1PGame &&
                prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                ShipDestructionCounter() == ShipDestruction_LastFrame &&
                CurrentWeapon() == CurrentWeapon_Shot &&
                // No submit if zero points
                Player1ScoreTensChar() != BlankScreenChar,
    cancel = always_true() &&
             (  // We prevent LB to start one whe lose the first life,
                // which will be the second decrease of the variable
                repeated(2, prev(LivesRemaining()) > LivesRemaining()) ||
                // Cancel: If we ever use a weapon that is not Shot
                once(CurrentWeapon() != CurrentWeapon_Shot) ||
                // Cancel: If we ever use the Shield
                once(ShipShield() != ShipShield_Off) ||
                // We reset previous hits at game start
                ResetHitsOnGameStart_Alt()
             ),
    submit = always_true(),
    value = Score(),
    format = "SCORE"
)

leaderboard(
    id = 87415, title = "Excellent Players - First Life, Bomb Only",
    description = "Highest score on very first life with Bomb. Get Bomb before Area 12 and never change that weapon nor use Shield.",
    start  =    GameSettingsCheck() &&
                GameMode() == GameMode_1PGame &&
                prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                ShipDestructionCounter() == ShipDestruction_LastFrame &&
                CurrentWeapon() == CurrentWeapon_Bomb &&
                // No submit if zero points
                Player1ScoreTensChar() != BlankScreenChar,
    cancel = always_true() &&
             (  // We prevent LB to start one whe lose the first life,
                // which will be the second decrease of the variable
                repeated(2, prev(LivesRemaining()) > LivesRemaining()) ||
                // Cancel: If we change to a weapon that is not Bomb
                (once(CurrentWeapon() != prev(CurrentWeapon()) && CurrentWeapon() != CurrentWeapon_Bomb)) ||
                // Cancel: If we reach Area 12 and Bomb is not the current weapon
                (once(MapSection() == 6 && CurrentWeapon() != CurrentWeapon_Bomb)) ||
                // Cancel: If we ever use the Shield
                (once(ShipShield() != ShipShield_Off)) ||
                // We reset previous hits at game start
                ResetHitsOnGameStart_Alt()
             ),
    submit = always_true(),
    value = Score(),
    format = "SCORE"
)

leaderboard(
    id = 87414, title = "Excellent Players - First Life, Laser Only",
    description = "Highest score on very first life with Laser. Get Laser before Area 12 and never change that weapon nor use Shield.",
    start  =    GameSettingsCheck() &&
                GameMode() == GameMode_1PGame &&
                prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                ShipDestructionCounter() == ShipDestruction_LastFrame &&
                CurrentWeapon() == CurrentWeapon_Laser &&
                // No submit if zero points
                Player1ScoreTensChar() != BlankScreenChar,
    cancel = always_true() &&
             (  // We prevent LB to start one whe lose the first life,
                // which will be the second decrease of the variable
                repeated(2, prev(LivesRemaining()) > LivesRemaining()) ||
                // Cancel: If we change to a weapon that is not Bomb
                (once(CurrentWeapon() != prev(CurrentWeapon()) && CurrentWeapon() != CurrentWeapon_Laser)) ||
                // Cancel: If we reach Area 12 and Bomb is not the current weapon
                (once(MapSection() == 6 && CurrentWeapon() != CurrentWeapon_Laser)) ||
                // Cancel: If we ever use the Shield
                (once(ShipShield() != ShipShield_Off)) ||
                // We reset previous hits at game start
                ResetHitsOnGameStart_Alt()
             ),
    submit = always_true(),
    value = Score(),
    format = "SCORE"
)

leaderboard(
    id = 87413, title = "Excellent Players - First Life, H.Mis. Only",
    description = "Highest score on very first life with H.Mis. Get H.Mis. before Area 12 and never change that weapon nor use Shield.",
    start  =    GameSettingsCheck() &&
                GameMode() == GameMode_1PGame &&
                prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame &&
                ShipDestructionCounter() == ShipDestruction_LastFrame &&
                CurrentWeapon() == CurrentWeapon_HM &&
                // No submit if zero points
                Player1ScoreTensChar() != BlankScreenChar,
    cancel = always_true() &&
             (  // We prevent LB to start one whe lose the first life,
                // which will be the second decrease of the variable
                repeated(2, prev(LivesRemaining()) > LivesRemaining()) ||
                // Cancel: If we change to a weapon that is not Bomb
                (once(CurrentWeapon() != prev(CurrentWeapon()) && CurrentWeapon() != CurrentWeapon_HM)) ||
                // Cancel: If we reach Area 12 and Bomb is not the current weapon
                (once(MapSection() == 6 && CurrentWeapon() != CurrentWeapon_HM)) ||
                // Cancel: If we ever use the Shield
                (once(ShipShield() != ShipShield_Off)) ||
                // We reset previous hits at game start
                ResetHitsOnGameStart_Alt()
             ),
    submit = always_true(),
    value = Score(),
    format = "SCORE"
)

leaderboard(
    id = 87416, title = "Into SlapNet's Nest Speedrun",
    description = "Fastest time to get past SlapNet as it defends the entrance to the Head Motherboard Facilities. Shield not allowed.",
    start  = GameSettingsCheck() &&
             GameMode() == GameMode_1PGame &&
             C0B0_Protection() &&
             MapSection() == 0x22 &&
             MapSectionOffset() == 0x068,             
    cancel = // If shield is active
             (ShipShield() != ShipShield_Off) ||
             // If ship is destroyed
             (ShipDestructionCounter() == ShipDestruction_LastFrame && prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame),
    submit = MapSection() == 0x22 &&
             MapSectionOffset() == 0xEA,
    value  = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 87418, title = "Terminate SlapNet Speedrun",
    description = "Fastest time to destroy SlapNet plugged to the Main Socket. Shield not allowed.",
    start  = GameSettingsCheck() &&
             GameMode() == GameMode_1PGame &&
             C0B0_Protection() &&
             MapSection() == 0x28 &&
             MapSectionOffset() == 0x80,
    cancel = (ShipShield() != ShipShield_Off) ||
             (ShipDestructionCounter() == ShipDestruction_LastFrame && prev(ShipDestructionCounter()) == ShipDestruction_PenUltFrame),
    submit = MapSection() == 0x28 &&
             MapSectionOffset() == 0x0E0,
    value  = measured(always_true()),
    format = "FRAMES"
)

leaderboard(
    id = 87419, title = "To Infinity and Beyond",
    description = "Furthest journey ever. 'Enhanced Area' measure, not limited to 255 (see code notes). Zero points cheat not allowed.",
    start  =    GameSettingsCheck() &&
                prev(GameMode()) == GameMode_1PGame && GameMode() == GameMode_1PGameOver,
    cancel =    // Cancel game session if ZP cheat
                once(DeadWithZeroPoints()) &&
                // Alt group: Eventualy reset ZP cheat hit at 1P game start
                ResetHitsOnGameStart(),
    submit =    always_true(),
    value  =    EnhancedArea(),
    format =    "VALUE"
)

leaderboard(
    id = 87420, title = "To Infinity and Beyond - First Life",
    description = "Furthest journey ever on very first life. 'Enhanced Area' measure. Zero points cheat not allowed.",
    start  =    GameSettingsCheck() &&
                GameMode() == GameMode_1PGame &&
                prev(ShipDestructionCounter()) == ShipDestruction_AntePenUltFrame &&
                ShipDestructionCounter() == ShipDestruction_PenUltFrame,
    cancel =    // We prevent LB to start one whe lose the first life,
                // which will be the second decrease of the variable
                repeated(2, prev(LivesRemaining()) > LivesRemaining()) &&
                // Alt group: reset previous hits at 1P game start
                ResetHitsOnGameStart(),
    submit =    always_true(),
    value =     EnhancedArea(),
    format =    "VALUE"
)

leaderboard(
    title = "The Conscientious Objector",
    description = "Furthest journey ever without shooting on very first life. 'Enhanced Area' measure.",
    start  =    GameSettingsCheck() &&
                GameMode() == GameMode_1PGame &&
                // First shot animation entry control byte.
                NeverShotSoFar() &&
                prev(ShipDestructionCounter()) == ShipDestruction_AntePenUltFrame &&
                ShipDestructionCounter() == ShipDestruction_PenUltFrame,
    cancel =    // We prevent LB to start one whe lose the first life,
                // which will be the second decrease of the variable
                repeated(2, prev(LivesRemaining()) > LivesRemaining()) &&
                // Alt group: reset previous hits at 1P game start
                ResetHitsOnGameStart(),
    submit =    always_true(),
    value =     EnhancedArea(),
    format =    "VALUE"
)

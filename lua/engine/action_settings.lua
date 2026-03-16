--- ActionSetting — generated from ActionSetting.xml
--- Require this module and access data through the returned table.

---@enum ReactionType
local ReactionType = {
    SINGLE = "SINGLE",
    ALL = "ALL",
    NONE = "NONE",
}

---@enum EmoteGroupName
local EmoteGroupName = {
    Dance = "Dance",
    Greeting = "Greeting",
    Joke = "Joke",
    Talk = "Talk",
    Offend = "Offend",
    Friendly = "Friendly",
    Neutral = "Neutral",
    Neutral_Female = "Neutral Female",
    Arrogant = "Arrogant",
    Aggressive = "Aggressive",
    Guard = "Guard",
    Vendor = "Vendor",
}

local ActionName = {
    Talk1 = "Talk1",
    Talk2 = "Talk2",
    Talk3 = "Talk3",
    Disagree = "Disagree",
    FreakOut = "FreakOut",
    Scold = "Scold",
    Agree = "Agree",
    Angry = "Angry",
    Chicken = "Chicken",
    Crying = "Crying",
    Bow = "Bow",
    Sad = "Sad",
    ShutUp = "ShutUp",
    Confused = "Confused",
    FunkyChickenDance = "FunkyChickenDance",
    ThrillerDance = "ThrillerDance",
    WormDance = "WormDance",
    Attract = "Attract",
    EmoteAggro01 = "EmoteAggro01",
    PanicRun = "PanicRun",
    Run = "Run",
    drawWeapon = "drawWeapon",
    retractWeapon = "retractWeapon",
    surpriseRight = "surpriseRight",
    surpriseUp = "surpriseUp",
    Giggle = "Giggle",
    Listening = "Listening",
    Whisper = "Whisper",
    LootLoop = "LootLoop",
    Idle01 = "Idle01",
    Idle02 = "Idle02",
    Idle03 = "Idle03",
    Idle04 = "Idle04",
    IdleMaleRelaxed = "IdleMaleRelaxed",
    IdleMaleDustOff = "IdleMaleDustOff",
    IdleMaleKickDirt = "IdleMaleKickDirt",
    IdleMaleLookAround = "IdleMaleLookAround",
    IdleMaleStretchShoulders = "IdleMaleStretchShoulders",
    IdleScratchHip = "IdleScratchHip",
    IdleScratchHead = "IdleScratchHead",
    IdleFemaleRelaxed = "IdleFemaleRelaxed",
    ListeningToWhisper = "ListeningToWhisper",
    PointForward = "PointForward",
    LeanOnWhisper = "LeanOnWhisper",
    TurnRight180Deg = "TurnRight180Deg",
    SitChairAgree = "SitChairAgree",
    SitChairLaugh = "SitChairLaugh",
    BarStoolGreeting = "BarStoolGreeting",
    BarStoolScratchHip = "BarStoolScratchHip",
    BarStoolYawn = "BarStoolYawn",
    SitStoolIdle = "SitStoolIdle",
    FlyIdle = "FlyIdle",
    CowerLoopUnusable = "CowerLoopUnusable",
    Applause = "Applause",
    MaleDance01 = "MaleDance01",
    MaleDance02 = "MaleDance02",
    Command01 = "Command01",
    Command02 = "Command02",
    ScratchHeadFast = "ScratchHeadFast",
    ShrugFast = "ShrugFast",
    RoarFast = "RoarFast",
    AngryFast = "AngryFast",
    PointForwardFast = "PointForwardFast",
    UpYoursFast = "UpYoursFast",
    ChickenFast = "ChickenFast",
    CryingFast = "CryingFast",
    LaughFast = "LaughFast",
    Inspect = "Inspect",
    SitGround = "SitGround",
    Beckon = "Beckon",
    Greeting = "Greeting",
    Laugh = "Laugh",
    Shrug = "Shrug",
    ThumbsDown = "ThumbsDown",
    ThumbsUp = "ThumbsUp",
    Yawn = "Yawn",
    GroovingDance = "GroovingDance",
    InjuredSitting = "InjuredSitting",
    BartenderIdle_Cleaning = "BartenderIdle_Cleaning",
    Drink = "Drink",
    FatIdle = "FatIdle",
    FatPraying = "FatPraying",
    DMDrawWeapon = "DMDrawWeapon",
    Block = "Block",
    BowFire = "BowFire",
    StabAttack = "StabAttack",
    ArcherCombatIdle = "ArcherCombatIdle",
    SpecialAttack00 = "SpecialAttack00",
    NormalAttack00 = "NormalAttack00",
    NormalAttack01 = "NormalAttack01",
    PikemanSpecialAttack = "PikemanSpecialAttack",
    PikemanHeavyAttack = "PikemanHeavyAttack",
    PikemanNormalAttack = "PikemanNormalAttack",
    Talk1Loop = "Talk1Loop",
    Nervous = "Nervous",
    CowerLoop = "CowerLoop",
    FlippingTheBird02 = "FlippingTheBird02",
    MaleSkinny02 = "MaleSkinny02",
    LeanOnFence = "LeanOnFence",
    IdleFat01 = "IdleFat01",
    TransitionRage = "TransitionRage",
    TransitionMagic = "TransitionMagic",
    QboostRage = "QboostRage",
    SitGroundLoop = "SitGroundLoop",
    PickUpObjLoop = "PickUpObjLoop",
    Punishment = "Punishment",
    CryingLoop = "CryingLoop",
    ListeningLoop = "ListeningLoop",
    BartenderIdle_Shaking = "BartenderIdle_Shaking",
    BartenderIdle_Flair = "BartenderIdle_Flair",
    Idle00 = "Idle00",
    WolfAttack01 = "WolfAttack01",
    WolfKnockback = "WolfKnockback",
    WolfStun = "WolfStun",
    WolfAttack03 = "WolfAttack03",
    WashClothes = "WashClothes",
    FishingFailed = "FishingFailed",
    Ironmonger = "Ironmonger",
    IdleFemSkinny02 = "IdleFemSkinny02",
    Kiss = "Kiss",
    FlippingTheBird01 = "FlippingTheBird01",
    JapaneseBow = "JapaneseBow",
    Stomp = "Stomp",
    UpYours = "UpYours",
    TransitionTech = "TransitionTech",
    TransitionAssassin = "TransitionAssassin",
    HitReactLeft = "HitReactLeft",
    Evade = "Evade",
    SwordsmanAttack02 = "SwordsmanAttack02",
    SwordsmanAttack00 = "SwordsmanAttack00",
    NoBarAccess = "NoBarAccess",
    HaveBarAccess = "HaveBarAccess",
    CheckBarAccess = "CheckBarAccess",
    RainOfFire = "RainOfFire",
    LootStart = "LootStart",
    LootEnd = "LootEnd",
    DeadPose = "DeadPose",
    FemaleDance02 = "FemaleDance02",
    Goodbye = "Goodbye",
    CallForHelp = "CallForHelp",
    WhiteArcherShootAimedLoop = "WhiteArcherShootAimedLoop",
    WhiteArcherCombatIdle = "WhiteArcherCombatIdle",
    Idle00Loop = "Idle00Loop",
    FlyIdleLoop = "FlyIdleLoop",
    EmoteBeckonLoop = "EmoteBeckonLoop",
    KnockFwd = "KnockFwd",
    KnockBack = "KnockBack",
    Salute = "Salute",
    DrawWeapon = "DrawWeapon",
    SpyGlassLook = "SpyGlassLook",
    SitChairApplause = "SitChairApplause",
    SitChairBeckon = "SitChairBeckon",
    SitChairDisagree = "SitChairDisagree",
    SitChairScold = "SitChairScold",
    SitChairShrug = "SitChairShrug",
    SitChairThumbsDown = "SitChairThumbsDown",
    SitChairThumbsUp = "SitChairThumbsUp",
    SitChairYawn = "SitChairYawn",
    SitChairIdle = "SitChairIdle",
    ShaderGotCaught = "ShaderGotCaught",
    Tutorial_Ghost = "Tutorial_Ghost",
    ReviveGetUp = "ReviveGetUp",
    ShareMyland = "ShareMyland",
    RequestMyland = "RequestMyland",
    RoarLoop = "RoarLoop",
    TransitionTwist = "TransitionTwist",
    Talk2Loop = "Talk2Loop",
    Talk3Loop = "Talk3Loop",
    InjuredSittingSlow = "InjuredSittingSlow",
    StandFire = "StandFire",
    HitReactGrab = "HitReactGrab",
    SitChairIdle01 = "SitChairIdle01",
    StandFire1in30 = "StandFire1in30",
    Death04 = "Death04",
    Idle04Loop = "Idle04Loop",
    SitToIdle02 = "SitToIdle02",
    StandUpFromChair = "StandUpFromChair",
    IronGiantIdle = "IronGiantIdle",
    IronGiantAngryRoar = "IronGiantAngryRoar",
    IronGiantHandSweep = "IronGiantHandSweep",
    IronGiantSwing = "IronGiantSwing",
    IronGiantPullBack = "IronGiantPullBack",
    IronGiantDeath = "IronGiantDeath",
    FemaleDance01Loop = "FemaleDance01Loop",
    FemaleDance02Loop = "FemaleDance02Loop",
    BartenderIdle_CleaningLoop = "BartenderIdle_CleaningLoop",
    DisagreeLoop = "DisagreeLoop",
    Turotial_FlyBackwardLoop = "Turotial_FlyBackwardLoop",
    HitReactGrabLoop = "HitReactGrabLoop",
    Tutorial_Fall = "Tutorial_Fall",
    Tutorial_HitReactFwd = "Tutorial_HitReactFwd",
    Tutorial_FlyRight = "Tutorial_FlyRight",
    TransitionCyber = "TransitionCyber",
    Tutorial_Idle00 = "Tutorial_Idle00",
    Tutorial_BossAttack001 = "Tutorial_BossAttack001",
    IdleScratchHeadLoop = "IdleScratchHeadLoop",
    IdleScratchHipLoop = "IdleScratchHipLoop",
    LaughLoop = "LaughLoop",
    Tutorial_Boss_Aggro = "Tutorial_Boss_Aggro",
    Tutorial_Boss_MarkTarget = "Tutorial_Boss_MarkTarget",
    Tutorial_Boss_WarCry = "Tutorial_Boss_WarCry",
    Tutorial_Boss_SelfHealLoop = "Tutorial_Boss_SelfHealLoop",
    Tutorial_Boss_SelfBuff = "Tutorial_Boss_SelfBuff",
    Tutorial_Boss_Stabber = "Tutorial_Boss_Stabber",
    OperateLoop = "OperateLoop",
    ThrowDice = "ThrowDice",
    FixSomething = "FixSomething",
    ScratchHeadSlow = "ScratchHeadSlow",
    LootSlow = "LootSlow",
    Operate = "Operate",
    InspectLoop = "InspectLoop",
    AtEaseLoop = "AtEaseLoop",
    PickUpObj = "PickUpObj",
    BackObjWalkLoop = "BackObjWalkLoop",
    BackObjDrop = "BackObjDrop",
    PickupFromFront = "PickupFromFront",
    Attention = "Attention",
    AtEaseLoopLong = "AtEaseLoopLong",
    CombatIdle00Loop = "CombatIdle00Loop",
    Fat_Pray = "Fat_Pray",
    Fat_Disgusted = "Fat_Disgusted",
    Drink_NotLoop = "Drink_NotLoop",
    RoarSlow = "RoarSlow",
    Command01_NotLoop = "Command01_NotLoop",
    ReviveGetUpSlow = "ReviveGetUpSlow",
    Nervous_NotLoop = "Nervous_NotLoop",
    Peace = "Peace",
    VictoryCheer = "VictoryCheer",
    Rake = "Rake",
    Beg = "Beg",
    PrayHumble = "PrayHumble",
    PrayArrogant = "PrayArrogant",
    DMSpecialAttack = "DMSpecialAttack",
    MoonJump = "MoonJump",
    SellarsLaunchTube = "SellarsLaunchTube",
    Death00 = "Death00",
    FistSlam = "FistSlam",
    TransitionRageSlow = "TransitionRageSlow",
    SpecialAttack01 = "SpecialAttack01",
    GetUp = "GetUp",
    Howling = "Howling",
    KnockDownIdle = "KnockDownIdle",
    JumpStart = "JumpStart",
    JumpLoop = "JumpLoop",
    JumpLand = "JumpLand",
    SitChairYawnLoop = "SitChairYawnLoop",
    UpYoursLoop = "UpYoursLoop",
    PointLoop = "PointLoop",
    InjuredGround = "InjuredGround",
    InteractGroundLoop = "InteractGroundLoop",
    KnockDown = "KnockDown",
    StompSlow = "StompSlow",
    AngryLoop = "AngryLoop",
    InjuredSittingSlow2 = "InjuredSittingSlow2",
    InjuredGroundSlow = "InjuredGroundSlow",
    ScratchHeadSlowLoop = "ScratchHeadSlowLoop",
    ThumbsUpLoop = "ThumbsUpLoop",
    ShrugFastLoop = "ShrugFastLoop",
    SearchAlertLoop = "SearchAlertLoop",
    StunLoop = "StunLoop",
    ScratchHead = "ScratchHead",
    ChildPlayCheer = "ChildPlayCheer",
    ChildPlayDice = "ChildPlayDice",
    ChildPlayListen01 = "ChildPlayListen01",
    ChildPlayListen02 = "ChildPlayListen02",
    InteractGroundSlow = "InteractGroundSlow",
    InteractKnee = "InteractKnee",
    InteractWaist = "InteractWaist",
    HitReactBackward = "HitReactBackward",
    SwordsmanAttack01 = "SwordsmanAttack01",
    InjuredGround02Slow = "InjuredGround02Slow",
    InjuredSlowLoop = "InjuredSlowLoop",
    Blacksmith = "Blacksmith",
    TellStory = "TellStory",
    ChildPlayRun = "ChildPlayRun",
    ChildPlayFly = "ChildPlayFly",
    SitGroundStorytimeLoop = "SitGroundStorytimeLoop",
    Assassin_LoginIdle = "Assassin_LoginIdle",
    TransitionTwistLoop = "TransitionTwistLoop",
    RoarSlowLoop = "RoarSlowLoop",
    GiggleLoop = "GiggleLoop",
    Idle05Loop = "Idle05Loop",
    Idle00Barbarian = "Idle00Barbarian",
    Idle04Female = "Idle04Female",
    WolfAttack01Loop = "WolfAttack01Loop",
    Search = "Search",
    ShufflerForward = "ShufflerForward",
    SpecialSkyHeal_Loop = "SpecialSkyHeal_Loop",
    Death00_GodHost = "Death00_GodHost",
    Idle00_GodHost = "Idle00_GodHost",
    ScoldLoop = "ScoldLoop",
    StandardAttack01Loop = "StandardAttack01Loop",
    StandardAttack02Loop = "StandardAttack02Loop",
    VormargAttackLoop = "VormargAttackLoop",
    Death03 = "Death03",
    InteractKneeLoop = "InteractKneeLoop",
    QuestInteractionIdle00 = "QuestInteractionIdle00",
    InteractWaistLoop = "InteractWaistLoop",
    Cower = "Cower",
    InjuredSittingFreeze = "InjuredSittingFreeze",
    FreakOutShort = "FreakOutShort",
    Energizer_LoginIdle_Slow = "Energizer_LoginIdle_Slow",
    Energizer_LoginSelected_Slow = "Energizer_LoginSelected_Slow",
    Idle00Loop_Slow = "Idle00Loop_Slow",
    Death00_IronGiant = "Death00_IronGiant",
    IronGiantIdle_Slow = "IronGiantIdle_Slow",
    TellStoryLoop = "TellStoryLoop",
    GreetingLoop = "GreetingLoop",
    KissLoop = "KissLoop",
    ChatLoop = "ChatLoop",
    Help = "Help",
    Facepalm = "Facepalm",
    Rude = "Rude",
}

local AnimName = {
    EmoteBasicConversation01 = "EmoteBasicConversation01",
    EmoteBasicConversation02 = "EmoteBasicConversation02",
    EmoteBasicConversation03 = "EmoteBasicConversation03",
    EmoteDisagree = "EmoteDisagree",
    EmoteFreakOut = "EmoteFreakOut",
    EmoteScold = "EmoteScold",
    EmoteAgree = "EmoteAgree",
    EmoteAngry = "EmoteAngry",
    EmoteChicken = "EmoteChicken",
    EmoteCrying = "EmoteCrying",
    EmoteJapaneseBow = "EmoteJapaneseBow",
    EmoteSad = "EmoteSad",
    EmoteShutUp = "EmoteShutUp",
    StandConfused = "StandConfused",
    EmoteDanceFunkyChicken = "EmoteDanceFunkyChicken",
    EmoteDanceThriller = "EmoteDanceThriller",
    EmoteWormDance = "EmoteWormDance",
    EmoteAttractAttention = "EmoteAttractAttention",
    EmoteAggro = "EmoteAggro",
    RunForwardPanic = "RunForwardPanic",
    SprintForward = "SprintForward",
    ADD_DrawWeapon = "ADD_DrawWeapon",
    ADD_RetractWeapon = "ADD_RetractWeapon",
    LookRightGDCVid = "LookRightGDCVid",
    LookUpGDCVid = "LookUpGDCVid",
    EmoteGiggle = "EmoteGiggle",
    EmoteListening = "EmoteListening",
    EmoteWhisper = "EmoteWhisper",
    LootLoop = "LootLoop",
    Idle01 = "Idle01",
    Idle02 = "Idle02",
    Idle03 = "Idle03",
    Idle04 = "Idle04",
    Idle08 = "Idle08",
    EmoteScratchHip = "EmoteScratchHip",
    EmoteScratchHead = "EmoteScratchHead",
    EmoteLeanOnWhisper = "EmoteLeanOnWhisper",
    EmotePointForwardLoop = "EmotePointForwardLoop",
    IdleTurnRight180Deg = "IdleTurnRight180Deg",
    EmoteChairAgree = "EmoteChairAgree",
    EmoteChairLaugh = "EmoteChairLaugh",
    EmoteGreetingBarCounter = "EmoteGreetingBarCounter",
    EmoteScratchHipBarCounter = "EmoteScratchHipBarCounter",
    EmoteYawnBarCounter = "EmoteYawnBarCounter",
    SitStoolIdle = "SitStoolIdle",
    FlyIdle = "FlyIdle",
    EmoteCowerLoop = "EmoteCowerLoop",
    EmoteApplause = "EmoteApplause",
    EmoteDanceMale01 = "EmoteDanceMale01",
    EmoteDanceMale02 = "EmoteDanceMale02",
    EmoteOrder = "EmoteOrder",
    EmoteOrderLabourers = "EmoteOrderLabourers",
    CombatActionScratchHead = "CombatActionScratchHead",
    CombatActionShrug = "CombatActionShrug",
    CombatActionRoar = "CombatActionRoar",
    CombatActionAngry = "CombatActionAngry",
    CombatActionPointForward = "CombatActionPointForward",
    CombatActionUpYours = "CombatActionUpYours",
    CombatActionChicken = "CombatActionChicken",
    CombatActionCrying = "CombatActionCrying",
    CombatActionLaugh = "CombatActionLaugh",
    EmoteInspect = "EmoteInspect",
    Sit02Idle = "Sit02Idle",
    EmoteBeckon = "EmoteBeckon",
    EmoteGreeting = "EmoteGreeting",
    EmoteLaugh = "EmoteLaugh",
    EmoteShrug = "EmoteShrug",
    EmoteThumbsDown = "EmoteThumbsDown",
    EmoteThumbsUp = "EmoteThumbsUp",
    EmoteYawn = "EmoteYawn",
    injured = "injured",
    BartenderIdle_Cleaning = "BartenderIdle_Cleaning",
    EmoteDrink = "EmoteDrink",
    Idle00 = "Idle00",
    EmotePray = "EmotePray",
    CombatDMDrawWeapon = "CombatDMDrawWeapon",
    CombatBlock = "CombatBlock",
    CombatBowFire = "CombatBowFire",
    CombatStabAttack = "CombatStabAttack",
    CombatIdle00 = "CombatIdle00",
    MeleeAimedSpecial00 = "MeleeAimedSpecial00",
    MeleeAimedNormal00 = "MeleeAimedNormal00",
    MeleeAimedNormal01 = "MeleeAimedNormal01",
    CombatSpecialAttack02 = "CombatSpecialAttack02",
    MeleeAimedHeavy00_ForwardThrust = "MeleeAimedHeavy00_ForwardThrust",
    MeleeAimedStandard00_DownwardThrust = "MeleeAimedStandard00_DownwardThrust",
    EmoteNervous = "EmoteNervous",
    CowerLoop = "CowerLoop",
    EmoteFlippingTheBird02 = "EmoteFlippingTheBird02",
    IdleMaleSkinny02 = "IdleMaleSkinny02",
    LeanOnFence = "LeanOnFence",
    IdleFat01 = "IdleFat01",
    TransitionRage = "TransitionRage",
    TransitionMagic = "TransitionMagic",
    QboostRage = "QboostRage",
    BackObjPickUp = "BackObjPickUp",
    BackObjIdle = "BackObjIdle",
    BartenderIdle_Shaking = "BartenderIdle_Shaking",
    BartenderIdle_Flair = "BartenderIdle_Flair",
    Attack01 = "Attack01",
    Knockback = "Knockback",
    Stun = "Stun",
    Attack03 = "Attack03",
    EmoteWashClothes = "EmoteWashClothes",
    FishermanIdle_Failed = "FishermanIdle_Failed",
    MeleeAimedStandard02 = "MeleeAimedStandard02",
    IdleFemSkinny02 = "IdleFemSkinny02",
    EmoteKiss = "EmoteKiss",
    EmoteFlippingTheBird01 = "EmoteFlippingTheBird01",
    CombatStomp = "CombatStomp",
    EmoteUpYours = "EmoteUpYours",
    TransitionTech = "TransitionTech",
    TransitionAssassin = "TransitionAssassin",
    ADD_HitReactLeft = "ADD_HitReactLeft",
    CombatEvade = "CombatEvade",
    MeleeAimedStandard00 = "MeleeAimedStandard00",
    EmoteHalt = "EmoteHalt",
    EmoteCanGoIn = "EmoteCanGoIn",
    CombatHitRainOfFire = "CombatHitRainOfFire",
    LootStart = "LootStart",
    LootEnd = "LootEnd",
    Dead = "Dead",
    EmoteDanceFemale02 = "EmoteDanceFemale02",
    EmoteGoodbye = "EmoteGoodbye",
    EmoteCallForHelp = "EmoteCallForHelp",
    ShootAimedNormalCastLoop00 = "ShootAimedNormalCastLoop00",
    CombatIdle = "CombatIdle",
    HitReactKnockFwd = "HitReactKnockFwd",
    HitReactKnockBack = "HitReactKnockBack",
    EmoteSalute = "EmoteSalute",
    CombatDrawWeapon = "CombatDrawWeapon",
    SpyGlassLookAround = "SpyGlassLookAround",
    EmoteChairApplause = "EmoteChairApplause",
    EmoteChairBeckon = "EmoteChairBeckon",
    EmoteChairDisagree = "EmoteChairDisagree",
    EmoteChairScold = "EmoteChairScold",
    EmoteChairShrug = "EmoteChairShrug",
    EmoteChairThumbsDown = "EmoteChairThumbsDown",
    EmoteChairThumbsUp = "EmoteChairThumbsUp",
    EmoteChairYawn = "EmoteChairYawn",
    SitChairIdle00 = "SitChairIdle00",
    OmniAimedSpecial00_InkCloud = "OmniAimedSpecial00_InkCloud",
    GhostCreate = "GhostCreate",
    ReviveGetUp = "ReviveGetUp",
    TransitionTwist = "TransitionTwist",
    StandFire = "StandFire",
    HitReactGrab = "HitReactGrab",
    SitChairIdle01 = "SitChairIdle01",
    StandFire1in30 = "StandFire1in30",
    Death04 = "Death04",
    SitToIdle02 = "SitToIdle02",
    StandUpChair = "StandUpChair",
    AngryRoar = "AngryRoar",
    BackHandSweep = "BackHandSweep",
    MeleeAimedStandard00_RLDiagonalSwing = "MeleeAimedStandard00_RLDiagonalSwing",
    PullBack = "PullBack",
    Death = "Death",
    EmoteDanceFemale01 = "EmoteDanceFemale01",
    FlyBackward = "FlyBackward",
    Fall = "Fall",
    HitReactFwdPose = "HitReactFwdPose",
    FlyRight = "FlyRight",
    TransitionCyber = "TransitionCyber",
    MeleeOmniStandard00_EnergySpike = "MeleeOmniStandard00_EnergySpike",
    MarkTarget = "MarkTarget",
    WarCry = "WarCry",
    SelfHeal_Loop = "SelfHeal_Loop",
    SelfBuff = "SelfBuff",
    StabberInject = "StabberInject",
    Operate = "Operate",
    EmoteThrowDice = "EmoteThrowDice",
    EmoteAtEaseLoop = "EmoteAtEaseLoop",
    BackObjWalkForward = "BackObjWalkForward",
    BackObjDropBox = "BackObjDropBox",
    FrontObjPickUp = "FrontObjPickUp",
    EmoteAttention = "EmoteAttention",
    EmoteDisgustedNo = "EmoteDisgustedNo",
    EmotePeace = "EmotePeace",
    EmoteVicCheer = "EmoteVicCheer",
    CombatDMSpecialAttack = "CombatDMSpecialAttack",
    MoonJump = "MoonJump",
    StandardAttack01 = "StandardAttack01",
    Death00 = "Death00",
    FistSlamShockwave_Loop = "FistSlamShockwave_Loop",
    SpecialAttack01 = "SpecialAttack01",
    GetUp = "GetUp",
    Howling = "Howling",
    KnockDownIdle = "KnockDownIdle",
    JumpStart = "JumpStart",
    JumpLoop = "JumpLoop",
    JumpLand = "JumpLand",
    EmotePoint = "EmotePoint",
    EmoteInjuredGround = "EmoteInjuredGround",
    InteractGround = "InteractGround",
    KnockDown01 = "KnockDown01",
    CombatSearchAlert = "CombatSearchAlert",
    EmoteChildPlayCheer = "EmoteChildPlayCheer",
    EmoteChildPlayDice = "EmoteChildPlayDice",
    EmoteChildPlayListen01 = "EmoteChildPlayListen01",
    EmoteChildPlayListen02 = "EmoteChildPlayListen02",
    InteractKnee = "InteractKnee",
    InteractWaist = "InteractWaist",
    HitReactBackward = "HitReactBackward",
    MeleeAimedStandard01 = "MeleeAimedStandard01",
    EmoteInjuredGround02 = "EmoteInjuredGround02",
    EmoteBlackSmithHammer = "EmoteBlackSmithHammer",
    EmoteTellStory = "EmoteTellStory",
    EmoteChildPlayRun = "EmoteChildPlayRun",
    EmoteChildPlayFly = "EmoteChildPlayFly",
    Assassin_LoginIdle = "Assassin_LoginIdle",
    Idle05 = "Idle05",
    Search = "Search",
    ShuffleForward = "ShuffleForward",
    SpecialSkyHeal_Loop = "SpecialSkyHeal_Loop",
    StandardAttack02 = "StandardAttack02",
    OneTwoSwingWithFists = "OneTwoSwingWithFists",
    Death03 = "Death03",
    QuestInteractionIdle00 = "QuestInteractionIdle00",
    Energizer_LoginIdle = "Energizer_LoginIdle",
    Energizer_LoginSelected = "Energizer_LoginSelected",
    EmoteChat = "EmoteChat",
}

local IconName = {
    UI_Otherland_Misc_ITEM_PlaceHolderIcon = "UI_Otherland.Misc.ITEM_PlaceHolderIcon",
    UI_Otherland_EmoteIcon_Emo_Beckon = "UI_Otherland.EmoteIcon.Emo_Beckon",
    UI_Otherland_EmoteIcon_Emo_Greet = "UI_Otherland.EmoteIcon.Emo_Greet",
    UI_Otherland_EmoteIcon_Emo_Laugh = "UI_Otherland.EmoteIcon.Emo_Laugh",
    UI_Otherland_EmoteIcon_Emo_Shrug = "UI_Otherland.EmoteIcon.Emo_Shrug",
    UI_Otherland_EmoteIcon_Emo_TDown = "UI_Otherland.EmoteIcon.Emo_TDown",
    UI_Otherland_EmoteIcon_Emo_TUp = "UI_Otherland.EmoteIcon.Emo_TUp",
    UI_Otherland_EmoteIcon_Emo_Yawn = "UI_Otherland.EmoteIcon.Emo_Yawn",
    UI_Otherland_EmoteIcon_Emo_Dance = "UI_Otherland.EmoteIcon.Emo_Dance",
    UI_Otherland_Misc_ITEM_PlaceH = "UI_Otherland.Misc.ITEM_PlaceH",
}

local ReactionSchemeName = {
    DefaultGroups = "DefaultGroups",
    Civilian = "Civilian",
    CivilianPolite = "CivilianPolite",
    BarDoorBouncer = "BarDoorBouncer",
    BartenderEnglishPub = "BartenderEnglishPub",
    BartenderBinary = "BartenderBinary",
    BartenderAbattoir = "BartenderAbattoir",
    Bartender8Squared = "Bartender8Squared",
    BartenderBlackRoom = "BartenderBlackRoom",
    BartenderBlueNote = "BartenderBlueNote",
    BartenderClub101 = "BartenderClub101",
    BartenderDJOcto = "BartenderDJOcto",
    BartenderDogfight = "BartenderDogfight",
    BartenderLoveNurseClinic = "BartenderLoveNurseClinic",
    BartenderPetals = "BartenderPetals",
    BartenderRoswell = "BartenderRoswell",
    BartenderTonyPlus = "BartenderTonyPlus",
    BartenderZebra = "BartenderZebra",
    BartenderDefault = "BartenderDefault",
    RichWife = "RichWife",
    OysterhouseKid = "OysterhouseKid",
    ShopPromoterAdventureInc = "ShopPromoterAdventureInc",
    ShopPromoterArmsAGettin = "ShopPromoterArmsAGettin",
    ShopPromoterBlingItOn = "ShopPromoterBlingItOn",
    ShopPromoterClass = "ShopPromoterClass",
    ShopPromoterExpressYourself = "ShopPromoterExpressYourself",
    ShopPromoterTheDataStore = "ShopPromoterTheDataStore",
    ShopPromoterGoThereDoThat = "ShopPromoterGoThereDoThat",
    ShopPromoterHackerShop = "ShopPromoterHackerShop",
    ShopPromoterLuckyUp = "ShopPromoterLuckyUp",
    ShopPromoterAttractBase = "ShopPromoterAttractBase",
    ShopPromoterThankBase = "ShopPromoterThankBase",
    ShopPromoterMetamorph = "ShopPromoterMetamorph",
    ShopPromoterNouveauMonde = "ShopPromoterNouveauMonde",
    ShopPromoterShowItOff = "ShopPromoterShowItOff",
    ShopPromoterTheGathering = "ShopPromoterTheGathering",
    ShopPromoterSomaForge = "ShopPromoterSomaForge",
    BarPromoterBlueNoteJazzClub = "BarPromoterBlueNoteJazzClub",
    BarPromoterDJOctoMiniGame = "BarPromoterDJOctoMiniGame",
    BarPromoterDogfightMiniGame = "BarPromoterDogfightMiniGame",
    BarPromoterEnglishPubMiniGame = "BarPromoterEnglishPubMiniGame",
    BarPromoter8Squared = "BarPromoter8Squared",
    BarPromoterRoswellMiniGame = "BarPromoterRoswellMiniGame",
    _8Squared_NonCombatAIBiped_AdmiralBurtonWindsorSmythe = "8Squared-NonCombatAIBiped-AdmiralBurtonWindsorSmythe",
    _8Squared_NonCombatAIBiped_BoatmenOnTheRiver = "8Squared-NonCombatAIBiped-BoatmenOnTheRiver",
    _8Squared_NonCombatAIBiped_CourtiersoftheWhitePrincess = "8Squared-NonCombatAIBiped-CourtiersoftheWhitePrincess",
    _8Squared_NonCombatAIBiped_CourtiersoftheRedQueen = "8Squared-NonCombatAIBiped-CourtiersoftheRedQueen",
    _8Squared_NonCombatAIBiped_DrKinski = "8Squared-NonCombatAIBiped-DrKinski",
    _8Squared_NonCombatAIBiped_Gleaners = "8Squared-NonCombatAIBiped-Gleaners",
    _8Squared_NonCombatAIBiped_GlenburnRebels = "8Squared-NonCombatAIBiped-GlenburnRebels",
    _8Squared_NonCombatAIBiped_GrangertheBlacksmith = "8Squared-NonCombatAIBiped-GrangertheBlacksmith",
    _8Squared_NonCombatAIBiped_GreatTimeMaster = "8Squared-NonCombatAIBiped-GreatTimeMaster",
    _8Squared_NonCombatAIBiped_HumungousFungusSpecialDefenceUnit = "8Squared-NonCombatAIBiped-HumungousFungusSpecialDefenceUnit",
    _8Squared_NonCombatAIBiped_LordDrake = "8Squared-NonCombatAIBiped-LordDrake",
    _8Squared_NonCombatAIBiped_Millers = "8Squared-NonCombatAIBiped-Millers",
    _8Squared_NonCombatAIBiped_MushroomPygmySage = "8Squared-NonCombatAIBiped-MushroomPygmySage",
    _8Squared_NonCombatAIBiped_OrphanGirls = "8Squared-NonCombatAIBiped-OrphanGirls",
    _8Squared_NonCombatAIBiped_ReclantTheHermit = "8Squared-NonCombatAIBiped-ReclantTheHermit",
    _8Squared_NonCombatAIBiped_ServantMaids = "8Squared-NonCombatAIBiped-ServantMaids",
    _8Squared_NonCombatAIBiped_StudentsOfTheAcademy = "8Squared-NonCombatAIBiped-StudentsOfTheAcademy",
    _8Squared_NonCombatAIBiped_Shopkeepers = "8Squared-NonCombatAIBiped-Shopkeepers",
    _8Squared_NonCombatAIBiped_TravelingVendor = "8Squared-NonCombatAIBiped-TravelingVendor",
    _8Squared_NonCombatAIBiped_WhitePrincess = "8Squared-NonCombatAIBiped-WhitePrincess",
    _8Squared_NonCombatAIBiped_BoatmanOnTheRiver0 = "8Squared-NonCombatAIBiped-BoatmanOnTheRiver0",
    _8Squared_NonCombatAIBiped_Shopkeeper0 = "8Squared-NonCombatAIBiped-Shopkeeper0",
    _8Squared_NonCombatAIBiped_Shopkeeper1 = "8Squared-NonCombatAIBiped-Shopkeeper1",
    _8Squared_NonCombatAIBiped_Shopkeeper2 = "8Squared-NonCombatAIBiped-Shopkeeper2",
    _8Squared_NonCombatAIBiped_GlenburnRebel0 = "8Squared-NonCombatAIBiped-GlenburnRebel0",
    _8Squared_NonCombatAIBiped_GlenburnRebel1 = "8Squared-NonCombatAIBiped-GlenburnRebel1",
    _8Squared_NonCombatAIBiped_GlenburnRebel2 = "8Squared-NonCombatAIBiped-GlenburnRebel2",
    _8Squared_NonCombatAIBiped_ServantMaid0 = "8Squared-NonCombatAIBiped-ServantMaid0",
    _8Squared_NonCombatAIBiped_ServantMaid1 = "8Squared-NonCombatAIBiped-ServantMaid1",
    _8Squared_NonCombatAIBiped_WhiteArmySoldiersOnLeave = "8Squared-NonCombatAIBiped-WhiteArmySoldiersOnLeave",
    _8Squared_NonCombatAIBiped_Insurgents = "8Squared-NonCombatAIBiped-Insurgents",
    _8Squared_NonCombatAIBiped_Spies = "8Squared-NonCombatAIBiped-Spies",
    _8Squared_NonCombatAIBiped_Florist0 = "8Squared-NonCombatAIBiped-Florist0",
    _8Squared_NonCombatAIBiped_RichWife = "8Squared-NonCombatAIBiped-RichWife",
    _8Squared_NonCombatAIBiped_FemalePeasant = "8Squared-NonCombatAIBiped-FemalePeasant",
    _8Squared_NonCombatAIBiped_MalePeasant = "8Squared-NonCombatAIBiped-MalePeasant",
    _8Squared_NonCombatAIBiped_FemaleVillagers = "8Squared-NonCombatAIBiped-FemaleVillagers",
    _8Squared_NonCombatAIBiped_MaleVillagers = "8Squared-NonCombatAIBiped-MaleVillagers",
    _8Squared_NonCombatAIBiped_Florist1 = "8Squared-NonCombatAIBiped-Florist1",
    _8Squared_NonCombatAIBiped_Florist2 = "8Squared-NonCombatAIBiped-Florist2",
    _8Squared_NonCombatAIBiped_FarmerChamManklins = "8Squared-NonCombatAIBiped-FarmerChamManklins",
    _8Squared_NonCombatAIBiped_FarmerSellaManklins = "8Squared-NonCombatAIBiped-FarmerSellaManklins",
    _8Squared_NonCombatAIBiped_OrphanBoy0 = "8Squared-NonCombatAIBiped-OrphanBoy0",
    _8Squared_NonCombatAIBiped_FishermanJerridJenks = "8Squared-NonCombatAIBiped-FishermanJerridJenks",
    _8Squared_NonCombatAIBiped_FishermanOlFrang = "8Squared-NonCombatAIBiped-FishermanOlFrang",
    _8Squared_NonCombatAIBiped_InnkeeperGeneral = "8Squared-NonCombatAIBiped-InnkeeperGeneral",
    _8Squared_NonCombatAIBiped_InnkeeperFishgut = "8Squared-NonCombatAIBiped-InnkeeperFishgut",
    _8Squared_NonCombatAIBiped_InnkeeperTroopersRest = "8Squared-NonCombatAIBiped-InnkeeperTroopersRest",
    _8Squared_NonCombatAIBiped_Beggars = "8Squared-NonCombatAIBiped-Beggars",
    _8Squared_NonCombatAIBiped_Burgher0 = "8Squared-NonCombatAIBiped-Burgher0",
    _8Squared_NonCombatAIBiped_Burgher1 = "8Squared-NonCombatAIBiped-Burgher1",
    _8Squared_NonCombatAIBiped_IronmongerOfTheForge = "8Squared-NonCombatAIBiped-IronmongerOfTheForge",
    _8Squared_NonCombatAIBiped_MayorOfBerkHampstead = "8Squared-NonCombatAIBiped-MayorOfBerkHampstead",
    _8Squared_NonCombatAIBiped_MayorOfFlowerdale = "8Squared-NonCombatAIBiped-MayorOfFlowerdale",
    _8Squared_NonCombatAIBiped_MonksOfRavenMinster = "8Squared-NonCombatAIBiped-MonksOfRavenMinster",
    _8Squared_NonCombatAIBiped_MayorOfArcadia = "8Squared-NonCombatAIBiped-MayorOfArcadia",
    _8Squared_NonCombatAIBiped_MayorHardinOfRiverton = "8Squared-NonCombatAIBiped-MayorHardinOfRiverton",
    _8Squared_NonCombatAIBiped_BrotherLanquistOfStJacobs = "8Squared-NonCombatAIBiped-BrotherLanquistOfStJacobs",
    _8Squared_NonCombatAIBiped_BrotherJanneOfStJacobs = "8Squared-NonCombatAIBiped-BrotherJanneOfStJacobs",
    _8Squared_NonCombatAIBiped_BrotherJerridTiminasOfStJacobs = "8Squared-NonCombatAIBiped-BrotherJerridTiminasOfStJacobs",
    _8Squared_NonCombatAIBiped_BrotherTemsOfStJacobs = "8Squared-NonCombatAIBiped-BrotherTemsOfStJacobs",
    _8Squared_NonCombatAIBiped_RedMonks = "8Squared-NonCombatAIBiped-RedMonks",
    _8Squared_NonCombatAIBiped_MonkOfTheGrail = "8Squared-NonCombatAIBiped-MonkOfTheGrail",
    NPC_Friendly = "NPC_Friendly",
    NPC_Neutral = "NPC_Neutral",
    NPC_Arrogant = "NPC_Arrogant",
    NPC_Aggressive = "NPC_Aggressive",
    NPC_Crazy = "NPC_Crazy",
    NPC_Paranoid = "NPC_Paranoid",
    NPC_Stupid = "NPC_Stupid",
    NPC_Enthusiastic = "NPC_Enthusiastic",
    NPC_QuestGiver = "NPC_QuestGiver",
    NPC_Vendor = "NPC_Vendor",
    NPC_Aloof = "NPC_Aloof",
    NPC_Timid = "NPC_Timid",
    Bartender70sBar = "Bartender70sBar",
    ShopPromoterMyBank = "ShopPromoterMyBank",
    BarPromoterPermanentInk = "BarPromoterPermanentInk",
    BarPromoter70sBar = "BarPromoter70sBar",
    BartenderPermanentInk = "BartenderPermanentInk",
    ShopPromoterTraderJ = "ShopPromoterTraderJ",
    CPWhitePawnInstancePromoter_TEMP = "CPWhitePawnInstancePromoter-TEMP",
    CPRedPawnInstancePromoter_TEMP = "CPRedPawnInstancePromoter-TEMP",
    _5Isle_NonCombatAiBiped_WoodIsland_Logger = "5Isle-NonCombatAiBiped-WoodIsland-Logger",
    _5Isle_NonCombatAiBiped_WoodIsland_MaleVillager = "5Isle-NonCombatAiBiped-WoodIsland-MaleVillager",
    _5Isle_NonCombatAiBiped_WoodIsland_FemaleVillager = "5Isle-NonCombatAiBiped-WoodIsland-FemaleVillager",
    _5Isle_NonCombatAiBiped_WoodIsland_Merchant = "5Isle-NonCombatAiBiped-WoodIsland-Merchant",
    _5Isle_NonCombatAiBiped_WoodIsland_StaticGuard = "5Isle-NonCombatAiBiped-WoodIsland-StaticGuard",
    _5Isle_NonCombatAiBiped_WoodIsland_PatrolGuard = "5Isle-NonCombatAiBiped-WoodIsland-PatrolGuard",
    _5Isle_NonCombatAiBiped_WaterIsland_Fisherman = "5Isle-NonCombatAiBiped-WaterIsland-Fisherman",
    _5Isle_NonCombatAiBiped_WaterIsland_MaleVillager = "5Isle-NonCombatAiBiped-WaterIsland-MaleVillager",
    _5Isle_NonCombatAiBiped_WaterIsland_FemaleVillager = "5Isle-NonCombatAiBiped-WaterIsland-FemaleVillager",
    _5Isle_NonCombatAiBiped_WaterIsland_Merchant = "5Isle-NonCombatAiBiped-WaterIsland-Merchant",
    _5Isle_NonCombatAiBiped_WaterIsland_StaticGuard = "5Isle-NonCombatAiBiped-WaterIsland-StaticGuard",
    _5Isle_NonCombatAiBiped_WaterIsland_PatrolGuard = "5Isle-NonCombatAiBiped-WaterIsland-PatrolGuard",
    _5Isle_NonCombatAiBiped_MetalIsland_MetalForger = "5Isle-NonCombatAiBiped-MetalIsland-MetalForger",
    _5Isle_NonCombatAiBiped_MetalIsland_MaleVillager = "5Isle-NonCombatAiBiped-MetalIsland-MaleVillager",
    _5Isle_NonCombatAiBiped_MetalIsland_FemaleVillager = "5Isle-NonCombatAiBiped-MetalIsland-FemaleVillager",
    _5Isle_NonCombatAiBiped_MetalIsland_Merchant = "5Isle-NonCombatAiBiped-MetalIsland-Merchant",
    _5Isle_NonCombatAiBiped_MetalIsland_StaticGuard = "5Isle-NonCombatAiBiped-MetalIsland-StaticGuard",
    _5Isle_NonCombatAiBiped_MetalIsland_PatrolGuard = "5Isle-NonCombatAiBiped-MetalIsland-PatrolGuard",
    _5Isle_NonCombatAiBiped_FireIsland_Emblazer = "5Isle-NonCombatAiBiped-FireIsland-Emblazer",
    _5Isle_NonCombatAiBiped_FireIsland_MaleVillager = "5Isle-NonCombatAiBiped-FireIsland-MaleVillager",
    _5Isle_NonCombatAiBiped_FireIsland_FemaleVillager = "5Isle-NonCombatAiBiped-FireIsland-FemaleVillager",
    _5Isle_NonCombatAiBiped_FireIsland_Merchant = "5Isle-NonCombatAiBiped-FireIsland-Merchant",
    _5Isle_NonCombatAiBiped_FireIsland_StaticGuard = "5Isle-NonCombatAiBiped-FireIsland-StaticGuard",
    _5Isle_NonCombatAiBiped_FireIsland_PatrolGuard = "5Isle-NonCombatAiBiped-FireIsland-PatrolGuard",
    _5Isle_NonCombatAiBiped_ThePeople_Male_Optimistic = "5Isle-NonCombatAiBiped-ThePeople-Male-Optimistic",
    _5Isle_NonCombatAiBiped_ThePeople_Male_Wise = "5Isle-NonCombatAiBiped-ThePeople-Male-Wise",
    _5Isle_NonCombatAiBiped_ThePeople_Male_IronJustice = "5Isle-NonCombatAiBiped-ThePeople-Male-IronJustice",
    _5Isle_NonCombatAiBiped_ThePeople_Male_Hopeless = "5Isle-NonCombatAiBiped-ThePeople-Male-Hopeless",
    _5Isle_NonCombatAiBiped_ThePeople_Male_Hopeful = "5Isle-NonCombatAiBiped-ThePeople-Male-Hopeful",
    _5Isle_NonCombatAiBiped_ThePeople_Male_Jolly = "5Isle-NonCombatAiBiped-ThePeople-Male-Jolly",
    _5Isle_NonCombatAiBiped_ThePeople_Male_Wise2 = "5Isle-NonCombatAiBiped-ThePeople-Male-Wise2",
    _5Isle_NonCombatAiBiped_ThePeople_Male_Ungrateful = "5Isle-NonCombatAiBiped-ThePeople-Male-Ungrateful",
    _5Isle_NonCombatAiBiped_ThePeople_Male_Happy = "5Isle-NonCombatAiBiped-ThePeople-Male-Happy",
    _5Isle_NonCombatAiBiped_ThePeople_Female_Optimistic = "5Isle-NonCombatAiBiped-ThePeople-Female-Optimistic",
    _5Isle_NonCombatAiBiped_ThePeople_Female_Wise = "5Isle-NonCombatAiBiped-ThePeople-Female-Wise",
    _5Isle_NonCombatAiBiped_ThePeople_Female_Philosophic = "5Isle-NonCombatAiBiped-ThePeople-Female-Philosophic",
    _5Isle_NonCombatAiBiped_ThePeople_Female_Troubled = "5Isle-NonCombatAiBiped-ThePeople-Female-Troubled",
    _5Isle_NonCombatAiBiped_ThePeople_Female_Forgetful = "5Isle-NonCombatAiBiped-ThePeople-Female-Forgetful",
    _5Isle_NonCombatAiBiped_ThePeople_Female_Paranoid = "5Isle-NonCombatAiBiped-ThePeople-Female-Paranoid",
    _5Isle_NonCombatAiBiped_ThePeople_Female_Materialistic = "5Isle-NonCombatAiBiped-ThePeople-Female-Materialistic",
    _5Isle_NonCombatAiBiped_ThePeople_Female_Curious = "5Isle-NonCombatAiBiped-ThePeople-Female-Curious",
    _5Isle_NonCombatAiBiped_ThePeople_Female_Cynical = "5Isle-NonCombatAiBiped-ThePeople-Female-Cynical",
    _5Isle_NonCombatAiBiped_ThePeople_Female_Inlove = "5Isle-NonCombatAiBiped-ThePeople-Female-Inlove",
    _5Isle_NonCombatAiBiped_ThePeople_Female_Jolly = "5Isle-NonCombatAiBiped-ThePeople-Female-Jolly",
    _5Isle_NonCombatAiBiped_ThePeople_Female_IronJustice = "5Isle-NonCombatAiBiped-ThePeople-Female-IronJustice",
    _5Isle_NonCombatAiBiped_ThePeople_Female_Worrywart = "5Isle-NonCombatAiBiped-ThePeople-Female-Worrywart",
    _5Isle_NonCombatAiBiped_ThePeople_Male_Inlove = "5Isle-NonCombatAiBiped-ThePeople-Male-Inlove",
    _5Isle_CombatAiBiped_Monkeyman01 = "5Isle-CombatAiBiped-Monkeyman01",
    _5Isle_CombatAiBiped_Monkeyman02 = "5Isle-CombatAiBiped-Monkeyman02",
    _5Isle_CombatAiBiped_Monkeyman03 = "5Isle-CombatAiBiped-Monkeyman03",
    _5Isle_CombatAiBiped_Monkeyman04 = "5Isle-CombatAiBiped-Monkeyman04",
    _5Isle_NonCombatAiBiped_ThePeople_Greeting1 = "5Isle-NonCombatAiBiped-ThePeople-Greeting1",
    _5Isle_NonCombatAiBiped_ThePeople_Greeting2 = "5Isle-NonCombatAiBiped-ThePeople-Greeting2",
    NewbieGuard = "NewbieGuard",
    Newbie_5Isle_Female_Balcony_Greeting01 = "Newbie-5Isle-Female-Balcony-Greeting01",
    Newbie_5Isle_Male_Balcony_Greeting01 = "Newbie-5Isle-Male-Balcony-Greeting01",
    Newbie_5Isle_Child_Balcony_Greeting01 = "Newbie-5Isle-Child-Balcony-Greeting01",
    _8Squared_TwinFort_ScoutingForAnswers_RedArmy = "8Squared-TwinFort-ScoutingForAnswers-RedArmy",
    _8Squared_TwinFort_ScoutingForAnswers_MedicWeasley = "8Squared-TwinFort-ScoutingForAnswers-MedicWeasley",
    Zombie01 = "Zombie01",
    ShopPromoterLotsOfSlots = "ShopPromoterLotsOfSlots",
}

---@class Action
---@field name            string
---@field duration        number
---@field reaction_type   ReactionType
---@field reaction_radius number
---@field anim_name       string
---@field anim_rate       number?
---@field looping         boolean
---@field icon_name       string

---@class WeightedItem
---@field weight number
---@field value  string

---@class WeightedOutput
---@field chance number
---@field items  WeightedItem[]

---@class ReactionPlan
---@field trigger_groups         string[]|nil
---@field trigger_actions        string[]|nil
---@field trigger_keywords_any   string[]|nil
---@field trigger_keywords_exact string[]|nil
---@field trigger_keywords_all   string[]|nil
---@field proximity_range        number|nil
---@field wait_duration          number|nil
---@field output_actions         WeightedOutput|nil
---@field output_groups          WeightedOutput|nil
---@field output_messages        WeightedOutput|nil

---@class ReactionSubScheme
---@field default_messages string[]
---@field plans            ReactionPlan[]

---@class ReactionScheme
---@field name     string
---@field inherit  string|nil
---@field friendly ReactionSubScheme|nil
---@field neutral  ReactionSubScheme|nil

---@class EmoteGroup
---@field name    EmoteGroupName
---@field actions string[]

---@type table<string, Action>
local Actions = {
    ["Talk1"] = {
        name            = ActionName.Talk1,
        duration        = 16.7,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteBasicConversation01,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Talk2"] = {
        name            = ActionName.Talk2,
        duration        = 23.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteBasicConversation02,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Talk3"] = {
        name            = ActionName.Talk3,
        duration        = 17.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteBasicConversation03,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Disagree"] = {
        name            = ActionName.Disagree,
        duration        = 3.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDisagree,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["FreakOut"] = {
        name            = ActionName.FreakOut,
        duration        = 6.7,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteFreakOut,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Scold"] = {
        name            = ActionName.Scold,
        duration        = 3.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteScold,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Agree"] = {
        name            = ActionName.Agree,
        duration        = 2.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteAgree,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Angry"] = {
        name            = ActionName.Angry,
        duration        = 2.4,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteAngry,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Chicken"] = {
        name            = ActionName.Chicken,
        duration        = 3.9,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChicken,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Crying"] = {
        name            = ActionName.Crying,
        duration        = 4.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteCrying,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Bow"] = {
        name            = ActionName.Bow,
        duration        = 4.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteJapaneseBow,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Sad"] = {
        name            = ActionName.Sad,
        duration        = 3.9333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteSad,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ShutUp"] = {
        name            = ActionName.ShutUp,
        duration        = 2.9667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteShutUp,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Confused"] = {
        name            = ActionName.Confused,
        duration        = 3.8667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.StandConfused,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["FunkyChickenDance"] = {
        name            = ActionName.FunkyChickenDance,
        duration        = 4.9333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDanceFunkyChicken,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ThrillerDance"] = {
        name            = ActionName.ThrillerDance,
        duration        = 14.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDanceThriller,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["WormDance"] = {
        name            = ActionName.WormDance,
        duration        = 5.333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteWormDance,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Attract"] = {
        name            = ActionName.Attract,
        duration        = 3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteAttractAttention,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["EmoteAggro01"] = {
        name            = ActionName.EmoteAggro01,
        duration        = 1.77,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteAggro,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["PanicRun"] = {
        name            = ActionName.PanicRun,
        duration        = 10,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.RunForwardPanic,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Run"] = {
        name            = ActionName.Run,
        duration        = 40,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.SprintForward,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["drawWeapon"] = {
        name            = ActionName.drawWeapon,
        duration        = 1.7,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.ADD_DrawWeapon,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["retractWeapon"] = {
        name            = ActionName.retractWeapon,
        duration        = 1.7,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.ADD_RetractWeapon,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["surpriseRight"] = {
        name            = ActionName.surpriseRight,
        duration        = 2.37,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.LookRightGDCVid,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["surpriseUp"] = {
        name            = ActionName.surpriseUp,
        duration        = 2.37,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.LookUpGDCVid,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Giggle"] = {
        name            = ActionName.Giggle,
        duration        = 4.07,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteGiggle,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Listening"] = {
        name            = ActionName.Listening,
        duration        = 9,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteListening,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Whisper"] = {
        name            = ActionName.Whisper,
        duration        = 4.27,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteWhisper,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["LootLoop"] = {
        name            = ActionName.LootLoop,
        duration        = 3.1,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.LootLoop,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Idle01"] = {
        name            = ActionName.Idle01,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle01,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Idle02"] = {
        name            = ActionName.Idle02,
        duration        = 3.1,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle02,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Idle03"] = {
        name            = ActionName.Idle03,
        duration        = 4.7667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle03,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Idle04"] = {
        name            = ActionName.Idle04,
        duration        = 3.6,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle04,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IdleMaleRelaxed"] = {
        name            = ActionName.IdleMaleRelaxed,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle01,
        anim_rate       = 0,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IdleMaleDustOff"] = {
        name            = ActionName.IdleMaleDustOff,
        duration        = 3.1,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle02,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IdleMaleKickDirt"] = {
        name            = ActionName.IdleMaleKickDirt,
        duration        = 4.7667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle03,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IdleMaleLookAround"] = {
        name            = ActionName.IdleMaleLookAround,
        duration        = 3.6,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle04,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IdleMaleStretchShoulders"] = {
        name            = ActionName.IdleMaleStretchShoulders,
        duration        = 3.1,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle08,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IdleScratchHip"] = {
        name            = ActionName.IdleScratchHip,
        duration        = 3.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteScratchHip,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IdleScratchHead"] = {
        name            = ActionName.IdleScratchHead,
        duration        = 3.5667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteScratchHead,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IdleFemaleRelaxed"] = {
        name            = ActionName.IdleFemaleRelaxed,
        duration        = 2.3333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle01,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ListeningToWhisper"] = {
        name            = ActionName.ListeningToWhisper,
        duration        = 5.1333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteLeanOnWhisper,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["PointForward"] = {
        name            = ActionName.PointForward,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmotePointForwardLoop,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["LeanOnWhisper"] = {
        name            = ActionName.LeanOnWhisper,
        duration        = 3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteLeanOnWhisper,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["TurnRight180Deg"] = {
        name            = ActionName.TurnRight180Deg,
        duration        = 3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.IdleTurnRight180Deg,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitChairAgree"] = {
        name            = ActionName.SitChairAgree,
        duration        = 2.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChairAgree,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitChairLaugh"] = {
        name            = ActionName.SitChairLaugh,
        duration        = 4.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChairLaugh,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["BarStoolGreeting"] = {
        name            = ActionName.BarStoolGreeting,
        duration        = 2.7,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteGreetingBarCounter,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["BarStoolScratchHip"] = {
        name            = ActionName.BarStoolScratchHip,
        duration        = 3.8,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteScratchHipBarCounter,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["BarStoolYawn"] = {
        name            = ActionName.BarStoolYawn,
        duration        = 5.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteYawnBarCounter,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitStoolIdle"] = {
        name            = ActionName.SitStoolIdle,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.SitStoolIdle,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["FlyIdle"] = {
        name            = ActionName.FlyIdle,
        duration        = 4,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.FlyIdle,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["CowerLoopUnusable"] = {
        name            = ActionName.CowerLoopUnusable,
        duration        = 2.3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteCowerLoop,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Applause"] = {
        name            = ActionName.Applause,
        duration        = 3.8333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteApplause,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["MaleDance01"] = {
        name            = ActionName.MaleDance01,
        duration        = 26.4667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDanceMale01,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["MaleDance02"] = {
        name            = ActionName.MaleDance02,
        duration        = 29.4333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDanceMale02,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Command01"] = {
        name            = ActionName.Command01,
        duration        = 5.3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteOrder,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Command02"] = {
        name            = ActionName.Command02,
        duration        = 4.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteOrderLabourers,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ScratchHeadFast"] = {
        name            = ActionName.ScratchHeadFast,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionScratchHead,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ShrugFast"] = {
        name            = ActionName.ShrugFast,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionShrug,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["RoarFast"] = {
        name            = ActionName.RoarFast,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionRoar,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["AngryFast"] = {
        name            = ActionName.AngryFast,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionAngry,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["PointForwardFast"] = {
        name            = ActionName.PointForwardFast,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionPointForward,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["UpYoursFast"] = {
        name            = ActionName.UpYoursFast,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionUpYours,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ChickenFast"] = {
        name            = ActionName.ChickenFast,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionChicken,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["CryingFast"] = {
        name            = ActionName.CryingFast,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionCrying,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["LaughFast"] = {
        name            = ActionName.LaughFast,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionLaugh,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Inspect"] = {
        name            = ActionName.Inspect,
        duration        = 8.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteInspect,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitGround"] = {
        name            = ActionName.SitGround,
        duration        = 2.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Sit02Idle,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Beckon"] = {
        name            = ActionName.Beckon,
        duration        = 2.5333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteBeckon,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_EmoteIcon_Emo_Beckon,
    },
    ["Greeting"] = {
        name            = ActionName.Greeting,
        duration        = 3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteGreeting,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_EmoteIcon_Emo_Greet,
    },
    ["Laugh"] = {
        name            = ActionName.Laugh,
        duration        = 5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteLaugh,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_EmoteIcon_Emo_Laugh,
    },
    ["Shrug"] = {
        name            = ActionName.Shrug,
        duration        = 1.6333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteShrug,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_EmoteIcon_Emo_Shrug,
    },
    ["ThumbsDown"] = {
        name            = ActionName.ThumbsDown,
        duration        = 3.6667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteThumbsDown,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_EmoteIcon_Emo_TDown,
    },
    ["ThumbsUp"] = {
        name            = ActionName.ThumbsUp,
        duration        = 2.7333,
        reaction_type   = ReactionType.ALL,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteThumbsUp,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_EmoteIcon_Emo_TUp,
    },
    ["Yawn"] = {
        name            = ActionName.Yawn,
        duration        = 5.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteYawn,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_EmoteIcon_Emo_Yawn,
    },
    ["GroovingDance"] = {
        name            = ActionName.GroovingDance,
        duration        = 29.4333,
        reaction_type   = ReactionType.ALL,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDanceMale02,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_EmoteIcon_Emo_Dance,
    },
    ["InjuredSitting"] = {
        name            = ActionName.InjuredSitting,
        duration        = 100,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.injured,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["BartenderIdle_Cleaning"] = {
        name            = ActionName.BartenderIdle_Cleaning,
        duration        = 7.5333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.BartenderIdle_Cleaning,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Drink"] = {
        name            = ActionName.Drink,
        duration        = 4,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDrink,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["FatIdle"] = {
        name            = ActionName.FatIdle,
        duration        = 2.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle00,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["FatPraying"] = {
        name            = ActionName.FatPraying,
        duration        = 5.5667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmotePray,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["DMDrawWeapon"] = {
        name            = ActionName.DMDrawWeapon,
        duration        = 1.4667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatDMDrawWeapon,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Block"] = {
        name            = ActionName.Block,
        duration        = 0.8667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatBlock,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["BowFire"] = {
        name            = ActionName.BowFire,
        duration        = 0.8,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatBowFire,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["StabAttack"] = {
        name            = ActionName.StabAttack,
        duration        = 1.1667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatStabAttack,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ArcherCombatIdle"] = {
        name            = ActionName.ArcherCombatIdle,
        duration        = 1.6667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatIdle00,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SpecialAttack00"] = {
        name            = ActionName.SpecialAttack00,
        duration        = 3.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.MeleeAimedSpecial00,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["NormalAttack00"] = {
        name            = ActionName.NormalAttack00,
        duration        = 1.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.MeleeAimedNormal00,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["NormalAttack01"] = {
        name            = ActionName.NormalAttack01,
        duration        = 1.2333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.MeleeAimedNormal01,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["PikemanSpecialAttack"] = {
        name            = ActionName.PikemanSpecialAttack,
        duration        = 2.8333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatSpecialAttack02,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["PikemanHeavyAttack"] = {
        name            = ActionName.PikemanHeavyAttack,
        duration        = 2.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.MeleeAimedHeavy00_ForwardThrust,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["PikemanNormalAttack"] = {
        name            = ActionName.PikemanNormalAttack,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.MeleeAimedStandard00_DownwardThrust,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Talk1Loop"] = {
        name            = ActionName.Talk1Loop,
        duration        = 16.7,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteBasicConversation01,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Nervous"] = {
        name            = ActionName.Nervous,
        duration        = 4.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteNervous,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["CowerLoop"] = {
        name            = ActionName.CowerLoop,
        duration        = 2.3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CowerLoop,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["FlippingTheBird02"] = {
        name            = ActionName.FlippingTheBird02,
        duration        = 1.8667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteFlippingTheBird02,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["MaleSkinny02"] = {
        name            = ActionName.MaleSkinny02,
        duration        = 2.3333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.IdleMaleSkinny02,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["LeanOnFence"] = {
        name            = ActionName.LeanOnFence,
        duration        = 6.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.LeanOnFence,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IdleFat01"] = {
        name            = ActionName.IdleFat01,
        duration        = 2.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.IdleFat01,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["TransitionRage"] = {
        name            = ActionName.TransitionRage,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.TransitionRage,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["TransitionMagic"] = {
        name            = ActionName.TransitionMagic,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.TransitionMagic,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["QboostRage"] = {
        name            = ActionName.QboostRage,
        duration        = 1,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.QboostRage,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitGroundLoop"] = {
        name            = ActionName.SitGroundLoop,
        duration        = 2.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Sit02Idle,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["PickUpObjLoop"] = {
        name            = ActionName.PickUpObjLoop,
        duration        = 6.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.BackObjPickUp,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Punishment"] = {
        name            = ActionName.Punishment,
        duration        = 2.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.BackObjIdle,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["CryingLoop"] = {
        name            = ActionName.CryingLoop,
        duration        = 4.367,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteCrying,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ListeningLoop"] = {
        name            = ActionName.ListeningLoop,
        duration        = 9,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteListening,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["BartenderIdle_Shaking"] = {
        name            = ActionName.BartenderIdle_Shaking,
        duration        = 4.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.BartenderIdle_Shaking,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["BartenderIdle_Flair"] = {
        name            = ActionName.BartenderIdle_Flair,
        duration        = 8.3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.BartenderIdle_Flair,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Idle00"] = {
        name            = ActionName.Idle00,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle00,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["WolfAttack01"] = {
        name            = ActionName.WolfAttack01,
        duration        = 1,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Attack01,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["WolfKnockback"] = {
        name            = ActionName.WolfKnockback,
        duration        = 0.8667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Knockback,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["WolfStun"] = {
        name            = ActionName.WolfStun,
        duration        = 1.3333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Stun,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["WolfAttack03"] = {
        name            = ActionName.WolfAttack03,
        duration        = 0.6333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Attack03,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["WashClothes"] = {
        name            = ActionName.WashClothes,
        duration        = 4.4,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteWashClothes,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["FishingFailed"] = {
        name            = ActionName.FishingFailed,
        duration        = 14.4333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.FishermanIdle_Failed,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Ironmonger"] = {
        name            = ActionName.Ironmonger,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.MeleeAimedStandard02,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IdleFemSkinny02"] = {
        name            = ActionName.IdleFemSkinny02,
        duration        = 10,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.IdleFemSkinny02,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Kiss"] = {
        name            = ActionName.Kiss,
        duration        = 3.2333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteKiss,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["FlippingTheBird01"] = {
        name            = ActionName.FlippingTheBird01,
        duration        = 3.7,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteFlippingTheBird01,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["JapaneseBow"] = {
        name            = ActionName.JapaneseBow,
        duration        = 4.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteJapaneseBow,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Stomp"] = {
        name            = ActionName.Stomp,
        duration        = 1,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatStomp,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["UpYours"] = {
        name            = ActionName.UpYours,
        duration        = 1.8667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteUpYours,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["TransitionTech"] = {
        name            = ActionName.TransitionTech,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.TransitionTech,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["TransitionAssassin"] = {
        name            = ActionName.TransitionAssassin,
        duration        = 2.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.TransitionAssassin,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["HitReactLeft"] = {
        name            = ActionName.HitReactLeft,
        duration        = 1.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.ADD_HitReactLeft,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Evade"] = {
        name            = ActionName.Evade,
        duration        = 1.4333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatEvade,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SwordsmanAttack02"] = {
        name            = ActionName.SwordsmanAttack02,
        duration        = 1.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.MeleeAimedStandard02,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SwordsmanAttack00"] = {
        name            = ActionName.SwordsmanAttack00,
        duration        = 1.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.MeleeAimedStandard00,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["NoBarAccess"] = {
        name            = ActionName.NoBarAccess,
        duration        = 3.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteHalt,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["HaveBarAccess"] = {
        name            = ActionName.HaveBarAccess,
        duration        = 2.7,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteCanGoIn,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["CheckBarAccess"] = {
        name            = ActionName.CheckBarAccess,
        duration        = 4.23,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteInspect,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["RainOfFire"] = {
        name            = ActionName.RainOfFire,
        duration        = 2.7,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatHitRainOfFire,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["LootStart"] = {
        name            = ActionName.LootStart,
        duration        = 0.6667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.LootStart,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["LootEnd"] = {
        name            = ActionName.LootEnd,
        duration        = 1.4667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.LootEnd,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["DeadPose"] = {
        name            = ActionName.DeadPose,
        duration        = 0.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Dead,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["FemaleDance02"] = {
        name            = ActionName.FemaleDance02,
        duration        = 24.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDanceFemale02,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Goodbye"] = {
        name            = ActionName.Goodbye,
        duration        = 2.9667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteGoodbye,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["CallForHelp"] = {
        name            = ActionName.CallForHelp,
        duration        = 4.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteCallForHelp,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["WhiteArcherShootAimedLoop"] = {
        name            = ActionName.WhiteArcherShootAimedLoop,
        duration        = 1.6667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.ShootAimedNormalCastLoop00,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["WhiteArcherCombatIdle"] = {
        name            = ActionName.WhiteArcherCombatIdle,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatIdle,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Idle00Loop"] = {
        name            = ActionName.Idle00Loop,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle00,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["FlyIdleLoop"] = {
        name            = ActionName.FlyIdleLoop,
        duration        = 4,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.FlyIdle,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["EmoteBeckonLoop"] = {
        name            = ActionName.EmoteBeckonLoop,
        duration        = 2.5333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteBeckon,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["KnockFwd"] = {
        name            = ActionName.KnockFwd,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.HitReactKnockFwd,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["KnockBack"] = {
        name            = ActionName.KnockBack,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.HitReactKnockBack,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Salute"] = {
        name            = ActionName.Salute,
        duration        = 2.3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteSalute,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["DrawWeapon"] = {
        name            = ActionName.DrawWeapon,
        duration        = 1.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatDrawWeapon,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SpyGlassLook"] = {
        name            = ActionName.SpyGlassLook,
        duration        = 14.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.SpyGlassLookAround,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitChairApplause"] = {
        name            = ActionName.SitChairApplause,
        duration        = 4.1,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChairApplause,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitChairBeckon"] = {
        name            = ActionName.SitChairBeckon,
        duration        = 2.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChairBeckon,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitChairDisagree"] = {
        name            = ActionName.SitChairDisagree,
        duration        = 3.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChairDisagree,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitChairScold"] = {
        name            = ActionName.SitChairScold,
        duration        = 3.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChairScold,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitChairShrug"] = {
        name            = ActionName.SitChairShrug,
        duration        = 1.6333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChairShrug,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitChairThumbsDown"] = {
        name            = ActionName.SitChairThumbsDown,
        duration        = 3.8667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChairThumbsDown,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitChairThumbsUp"] = {
        name            = ActionName.SitChairThumbsUp,
        duration        = 2.3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChairThumbsUp,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitChairYawn"] = {
        name            = ActionName.SitChairYawn,
        duration        = 5.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChairYawn,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitChairIdle"] = {
        name            = ActionName.SitChairIdle,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.SitChairIdle00,
        anim_rate       = nil,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ShaderGotCaught"] = {
        name            = ActionName.ShaderGotCaught,
        duration        = 3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.OmniAimedSpecial00_InkCloud,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Tutorial_Ghost"] = {
        name            = ActionName.Tutorial_Ghost,
        duration        = 0.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.GhostCreate,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ReviveGetUp"] = {
        name            = ActionName.ReviveGetUp,
        duration        = 4,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.ReviveGetUp,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ShareMyland"] = {
        name            = ActionName.ShareMyland,
        duration        = 2.3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteListening,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["RequestMyland"] = {
        name            = ActionName.RequestMyland,
        duration        = 4.37,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteWhisper,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["RoarLoop"] = {
        name            = ActionName.RoarLoop,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionRoar,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["TransitionTwist"] = {
        name            = ActionName.TransitionTwist,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.TransitionTwist,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Talk2Loop"] = {
        name            = ActionName.Talk2Loop,
        duration        = 23.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteBasicConversation02,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Talk3Loop"] = {
        name            = ActionName.Talk3Loop,
        duration        = 17.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteBasicConversation03,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["InjuredSittingSlow"] = {
        name            = ActionName.InjuredSittingSlow,
        duration        = 0.6667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.injured,
        anim_rate       = 0.25,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["StandFire"] = {
        name            = ActionName.StandFire,
        duration        = 0.8333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.StandFire,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["HitReactGrab"] = {
        name            = ActionName.HitReactGrab,
        duration        = 1.5333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.HitReactGrab,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitChairIdle01"] = {
        name            = ActionName.SitChairIdle01,
        duration        = 12.1667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.SitChairIdle01,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["StandFire1in30"] = {
        name            = ActionName.StandFire1in30,
        duration        = 1,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.StandFire1in30,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Death04"] = {
        name            = ActionName.Death04,
        duration        = 3.8,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Death04,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Idle04Loop"] = {
        name            = ActionName.Idle04Loop,
        duration        = 3.6,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle04,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitToIdle02"] = {
        name            = ActionName.SitToIdle02,
        duration        = 3.8333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.SitToIdle02,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["StandUpFromChair"] = {
        name            = ActionName.StandUpFromChair,
        duration        = 2.7,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.StandUpChair,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IronGiantIdle"] = {
        name            = ActionName.IronGiantIdle,
        duration        = 3.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatIdle00,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IronGiantAngryRoar"] = {
        name            = ActionName.IronGiantAngryRoar,
        duration        = 4.8,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.AngryRoar,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IronGiantHandSweep"] = {
        name            = ActionName.IronGiantHandSweep,
        duration        = 3.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.BackHandSweep,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IronGiantSwing"] = {
        name            = ActionName.IronGiantSwing,
        duration        = 3.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.MeleeAimedStandard00_RLDiagonalSwing,
        anim_rate       = 0.8,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IronGiantPullBack"] = {
        name            = ActionName.IronGiantPullBack,
        duration        = 3.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.PullBack,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IronGiantDeath"] = {
        name            = ActionName.IronGiantDeath,
        duration        = 10.6667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Death,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["FemaleDance01Loop"] = {
        name            = ActionName.FemaleDance01Loop,
        duration        = 20.9333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDanceFemale01,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["FemaleDance02Loop"] = {
        name            = ActionName.FemaleDance02Loop,
        duration        = 24.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDanceFemale02,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["BartenderIdle_CleaningLoop"] = {
        name            = ActionName.BartenderIdle_CleaningLoop,
        duration        = 7.5333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.BartenderIdle_Cleaning,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["DisagreeLoop"] = {
        name            = ActionName.DisagreeLoop,
        duration        = 3.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDisagree,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Turotial_FlyBackwardLoop"] = {
        name            = ActionName.Turotial_FlyBackwardLoop,
        duration        = 0.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.FlyBackward,
        anim_rate       = 0.01,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["HitReactGrabLoop"] = {
        name            = ActionName.HitReactGrabLoop,
        duration        = 1.5333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.HitReactGrab,
        anim_rate       = 0.01,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Tutorial_Fall"] = {
        name            = ActionName.Tutorial_Fall,
        duration        = 0.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Fall,
        anim_rate       = 0.01,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Tutorial_HitReactFwd"] = {
        name            = ActionName.Tutorial_HitReactFwd,
        duration        = 0.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.HitReactFwdPose,
        anim_rate       = 0.01,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Tutorial_FlyRight"] = {
        name            = ActionName.Tutorial_FlyRight,
        duration        = 0.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.FlyRight,
        anim_rate       = 0.01,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["TransitionCyber"] = {
        name            = ActionName.TransitionCyber,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.TransitionCyber,
        anim_rate       = 0.5,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Tutorial_Idle00"] = {
        name            = ActionName.Tutorial_Idle00,
        duration        = 2.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle00,
        anim_rate       = 0.1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Tutorial_BossAttack001"] = {
        name            = ActionName.Tutorial_BossAttack001,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.MeleeOmniStandard00_EnergySpike,
        anim_rate       = 0.5,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IdleScratchHeadLoop"] = {
        name            = ActionName.IdleScratchHeadLoop,
        duration        = 3.5667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteScratchHead,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IdleScratchHipLoop"] = {
        name            = ActionName.IdleScratchHipLoop,
        duration        = 3.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteScratchHip,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["LaughLoop"] = {
        name            = ActionName.LaughLoop,
        duration        = 5.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteLaugh,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Tutorial_Boss_Aggro"] = {
        name            = ActionName.Tutorial_Boss_Aggro,
        duration        = 1.7667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteAggro,
        anim_rate       = 0.5,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Tutorial_Boss_MarkTarget"] = {
        name            = ActionName.Tutorial_Boss_MarkTarget,
        duration        = 1.8,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.MarkTarget,
        anim_rate       = 0.5,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Tutorial_Boss_WarCry"] = {
        name            = ActionName.Tutorial_Boss_WarCry,
        duration        = 1.5333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.WarCry,
        anim_rate       = 0.1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Tutorial_Boss_SelfHealLoop"] = {
        name            = ActionName.Tutorial_Boss_SelfHealLoop,
        duration        = 0.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.SelfHeal_Loop,
        anim_rate       = 0.05,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Tutorial_Boss_SelfBuff"] = {
        name            = ActionName.Tutorial_Boss_SelfBuff,
        duration        = 1.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.SelfBuff,
        anim_rate       = 0.5,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Tutorial_Boss_Stabber"] = {
        name            = ActionName.Tutorial_Boss_Stabber,
        duration        = 0.6333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.StabberInject,
        anim_rate       = 0.1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["OperateLoop"] = {
        name            = ActionName.OperateLoop,
        duration        = 3.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Operate,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ThrowDice"] = {
        name            = ActionName.ThrowDice,
        duration        = 2.8667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteThrowDice,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["FixSomething"] = {
        name            = ActionName.FixSomething,
        duration        = 4.4,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteWashClothes,
        anim_rate       = 0.5,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ScratchHeadSlow"] = {
        name            = ActionName.ScratchHeadSlow,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionScratchHead,
        anim_rate       = 0.5,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["LootSlow"] = {
        name            = ActionName.LootSlow,
        duration        = 3.1,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.LootLoop,
        anim_rate       = 0.5,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Operate"] = {
        name            = ActionName.Operate,
        duration        = 3.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Operate,
        anim_rate       = 0.8,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["InspectLoop"] = {
        name            = ActionName.InspectLoop,
        duration        = 4.23,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteInspect,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["AtEaseLoop"] = {
        name            = ActionName.AtEaseLoop,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteAtEaseLoop,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["PickUpObj"] = {
        name            = ActionName.PickUpObj,
        duration        = 6.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.BackObjPickUp,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["BackObjWalkLoop"] = {
        name            = ActionName.BackObjWalkLoop,
        duration        = 1.6333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.BackObjWalkForward,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["BackObjDrop"] = {
        name            = ActionName.BackObjDrop,
        duration        = 4.1667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.BackObjDropBox,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["PickupFromFront"] = {
        name            = ActionName.PickupFromFront,
        duration        = 3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.FrontObjPickUp,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Attention"] = {
        name            = ActionName.Attention,
        duration        = 2.533,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteAttention,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["AtEaseLoopLong"] = {
        name            = ActionName.AtEaseLoopLong,
        duration        = 30,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteAtEaseLoop,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["CombatIdle00Loop"] = {
        name            = ActionName.CombatIdle00Loop,
        duration        = 1.7,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatIdle00,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Fat_Pray"] = {
        name            = ActionName.Fat_Pray,
        duration        = 5.5667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmotePray,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Fat_Disgusted"] = {
        name            = ActionName.Fat_Disgusted,
        duration        = 3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDisgustedNo,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Drink_NotLoop"] = {
        name            = ActionName.Drink_NotLoop,
        duration        = 4,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDrink,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["RoarSlow"] = {
        name            = ActionName.RoarSlow,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionRoar,
        anim_rate       = 0.5,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Command01_NotLoop"] = {
        name            = ActionName.Command01_NotLoop,
        duration        = 5.3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteOrder,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ReviveGetUpSlow"] = {
        name            = ActionName.ReviveGetUpSlow,
        duration        = 4,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.ReviveGetUp,
        anim_rate       = 0.5,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Nervous_NotLoop"] = {
        name            = ActionName.Nervous_NotLoop,
        duration        = 4.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteNervous,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Peace"] = {
        name            = ActionName.Peace,
        duration        = 2.1,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmotePeace,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["VictoryCheer"] = {
        name            = ActionName.VictoryCheer,
        duration        = 4.8667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteVicCheer,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Rake"] = {
        name            = ActionName.Rake,
        duration        = 4.9333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDanceFunkyChicken,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Beg"] = {
        name            = ActionName.Beg,
        duration        = 4.9333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDanceFunkyChicken,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["PrayHumble"] = {
        name            = ActionName.PrayHumble,
        duration        = 4.933,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDanceFunkyChicken,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["PrayArrogant"] = {
        name            = ActionName.PrayArrogant,
        duration        = 4.933,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteDanceFunkyChicken,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["DMSpecialAttack"] = {
        name            = ActionName.DMSpecialAttack,
        duration        = 4.1,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatDMSpecialAttack,
        anim_rate       = 1.5,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["MoonJump"] = {
        name            = ActionName.MoonJump,
        duration        = 10,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.MoonJump,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SellarsLaunchTube"] = {
        name            = ActionName.SellarsLaunchTube,
        duration        = 4.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.StandardAttack01,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Death00"] = {
        name            = ActionName.Death00,
        duration        = 2.9,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Death00,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["FistSlam"] = {
        name            = ActionName.FistSlam,
        duration        = 0.3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.FistSlamShockwave_Loop,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["TransitionRageSlow"] = {
        name            = ActionName.TransitionRageSlow,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.TransitionRage,
        anim_rate       = 0.01,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SpecialAttack01"] = {
        name            = ActionName.SpecialAttack01,
        duration        = 3.64,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.SpecialAttack01,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["GetUp"] = {
        name            = ActionName.GetUp,
        duration        = 1.5333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.GetUp,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Howling"] = {
        name            = ActionName.Howling,
        duration        = 2.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Howling,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["KnockDownIdle"] = {
        name            = ActionName.KnockDownIdle,
        duration        = 0.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.KnockDownIdle,
        anim_rate       = 0.1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["JumpStart"] = {
        name            = ActionName.JumpStart,
        duration        = 0.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.JumpStart,
        anim_rate       = 0.1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["JumpLoop"] = {
        name            = ActionName.JumpLoop,
        duration        = 1,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.JumpLoop,
        anim_rate       = 0.1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["JumpLand"] = {
        name            = ActionName.JumpLand,
        duration        = 0.4,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.JumpLand,
        anim_rate       = 0.1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SitChairYawnLoop"] = {
        name            = ActionName.SitChairYawnLoop,
        duration        = 5.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChairYawn,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["UpYoursLoop"] = {
        name            = ActionName.UpYoursLoop,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionUpYours,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["CryingLoop"] = {
        name            = ActionName.CryingLoop,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionCrying,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["PointLoop"] = {
        name            = ActionName.PointLoop,
        duration        = 2.8667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmotePoint,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["InjuredGround"] = {
        name            = ActionName.InjuredGround,
        duration        = 5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteInjuredGround,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["InteractGroundLoop"] = {
        name            = ActionName.InteractGroundLoop,
        duration        = 1.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.InteractGround,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["KnockDown"] = {
        name            = ActionName.KnockDown,
        duration        = 2.1667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.KnockDown01,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["StompSlow"] = {
        name            = ActionName.StompSlow,
        duration        = 1,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatStomp,
        anim_rate       = 0.5,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["AngryLoop"] = {
        name            = ActionName.AngryLoop,
        duration        = 2.4,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteAngry,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["InjuredSittingSlow2"] = {
        name            = ActionName.InjuredSittingSlow2,
        duration        = 0.667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.injured,
        anim_rate       = 0.5,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["InjuredGroundSlow"] = {
        name            = ActionName.InjuredGroundSlow,
        duration        = 5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteInjuredGround,
        anim_rate       = 0.5,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ScratchHeadSlowLoop"] = {
        name            = ActionName.ScratchHeadSlowLoop,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionScratchHead,
        anim_rate       = 0.5,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ThumbsUpLoop"] = {
        name            = ActionName.ThumbsUpLoop,
        duration        = 2.7333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteThumbsUp,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ShrugFastLoop"] = {
        name            = ActionName.ShrugFastLoop,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionShrug,
        anim_rate       = 0.6,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SearchAlertLoop"] = {
        name            = ActionName.SearchAlertLoop,
        duration        = 2.2333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatSearchAlert,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["StunLoop"] = {
        name            = ActionName.StunLoop,
        duration        = 1.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Stun,
        anim_rate       = 0.5,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ScratchHead"] = {
        name            = ActionName.ScratchHead,
        duration        = 3.5667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteScratchHead,
        anim_rate       = 0.9,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ChildPlayCheer"] = {
        name            = ActionName.ChildPlayCheer,
        duration        = 4.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChildPlayCheer,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ChildPlayDice"] = {
        name            = ActionName.ChildPlayDice,
        duration        = 8.4667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChildPlayDice,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ChildPlayListen01"] = {
        name            = ActionName.ChildPlayListen01,
        duration        = 6.7667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChildPlayListen01,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ChildPlayListen02"] = {
        name            = ActionName.ChildPlayListen02,
        duration        = 6.7667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChildPlayListen02,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["InteractGroundSlow"] = {
        name            = ActionName.InteractGroundSlow,
        duration        = 1.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.InteractGround,
        anim_rate       = 0.7,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["InteractKnee"] = {
        name            = ActionName.InteractKnee,
        duration        = 1.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.InteractKnee,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["InteractWaist"] = {
        name            = ActionName.InteractWaist,
        duration        = 1.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.InteractWaist,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["HitReactBackward"] = {
        name            = ActionName.HitReactBackward,
        duration        = 0.7333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.HitReactBackward,
        anim_rate       = 0.6,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SwordsmanAttack01"] = {
        name            = ActionName.SwordsmanAttack01,
        duration        = 1.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.MeleeAimedStandard01,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["InjuredGround02Slow"] = {
        name            = ActionName.InjuredGround02Slow,
        duration        = 3.8667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteInjuredGround02,
        anim_rate       = 0.75,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["InjuredSlowLoop"] = {
        name            = ActionName.InjuredSlowLoop,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.injured,
        anim_rate       = 0.75,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Blacksmith"] = {
        name            = ActionName.Blacksmith,
        duration        = 4.8,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteBlackSmithHammer,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["TellStory"] = {
        name            = ActionName.TellStory,
        duration        = 6.667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteTellStory,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ChildPlayRun"] = {
        name            = ActionName.ChildPlayRun,
        duration        = 1.433,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChildPlayRun,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceH,
    },
    ["ChildPlayFly"] = {
        name            = ActionName.ChildPlayFly,
        duration        = 2.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChildPlayFly,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceH,
    },
    ["SitGroundStorytimeLoop"] = {
        name            = ActionName.SitGroundStorytimeLoop,
        duration        = 60,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Sit02Idle,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Assassin_LoginIdle"] = {
        name            = ActionName.Assassin_LoginIdle,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Assassin_LoginIdle,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["TransitionTwistLoop"] = {
        name            = ActionName.TransitionTwistLoop,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.TransitionTwist,
        anim_rate       = 0.5,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["RoarSlowLoop"] = {
        name            = ActionName.RoarSlowLoop,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatActionRoar,
        anim_rate       = 0.5,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["GiggleLoop"] = {
        name            = ActionName.GiggleLoop,
        duration        = 4.07,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteGiggle,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Idle05Loop"] = {
        name            = ActionName.Idle05Loop,
        duration        = 3.9333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle05,
        anim_rate       = 0.5,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Idle00Barbarian"] = {
        name            = ActionName.Idle00Barbarian,
        duration        = 1.8667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle00,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Idle04Female"] = {
        name            = ActionName.Idle04Female,
        duration        = 5.1667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle04,
        anim_rate       = 0.7,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["WolfAttack01Loop"] = {
        name            = ActionName.WolfAttack01Loop,
        duration        = 1.8333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Attack01,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Search"] = {
        name            = ActionName.Search,
        duration        = 2.7,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Search,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ShufflerForward"] = {
        name            = ActionName.ShufflerForward,
        duration        = 0.8333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.ShuffleForward,
        anim_rate       = 0.7,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["SpecialSkyHeal_Loop"] = {
        name            = ActionName.SpecialSkyHeal_Loop,
        duration        = 1,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.SpecialSkyHeal_Loop,
        anim_rate       = 0.7,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Death00_GodHost"] = {
        name            = ActionName.Death00_GodHost,
        duration        = 6.2667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Death00,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Idle00_GodHost"] = {
        name            = ActionName.Idle00_GodHost,
        duration        = 3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle00,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ScoldLoop"] = {
        name            = ActionName.ScoldLoop,
        duration        = 3.3667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteScold,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["StandardAttack01Loop"] = {
        name            = ActionName.StandardAttack01Loop,
        duration        = 1.5333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.StandardAttack01,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["StandardAttack02Loop"] = {
        name            = ActionName.StandardAttack02Loop,
        duration        = 1.5333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.StandardAttack02,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["VormargAttackLoop"] = {
        name            = ActionName.VormargAttackLoop,
        duration        = 2.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.OneTwoSwingWithFists,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Death03"] = {
        name            = ActionName.Death03,
        duration        = 1.7667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Death03,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["InteractKneeLoop"] = {
        name            = ActionName.InteractKneeLoop,
        duration        = 1.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.InteractKnee,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["QuestInteractionIdle00"] = {
        name            = ActionName.QuestInteractionIdle00,
        duration        = 4.1667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.QuestInteractionIdle00,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["InteractWaistLoop"] = {
        name            = ActionName.InteractWaistLoop,
        duration        = 1.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.InteractWaist,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Cower"] = {
        name            = ActionName.Cower,
        duration        = 2.3,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CowerLoop,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["InjuredSittingFreeze"] = {
        name            = ActionName.InjuredSittingFreeze,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.injured,
        anim_rate       = 0.01,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["FreakOutShort"] = {
        name            = ActionName.FreakOutShort,
        duration        = 1.5,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteFreakOut,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Energizer_LoginIdle_Slow"] = {
        name            = ActionName.Energizer_LoginIdle_Slow,
        duration        = 2.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Energizer_LoginIdle,
        anim_rate       = 0.01,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Energizer_LoginSelected_Slow"] = {
        name            = ActionName.Energizer_LoginSelected_Slow,
        duration        = 2.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Energizer_LoginSelected,
        anim_rate       = 0.01,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Idle00Loop_Slow"] = {
        name            = ActionName.Idle00Loop_Slow,
        duration        = 2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Idle00,
        anim_rate       = 0.01,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Death00_IronGiant"] = {
        name            = ActionName.Death00_IronGiant,
        duration        = 10.6667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.Death00,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["IronGiantIdle_Slow"] = {
        name            = ActionName.IronGiantIdle_Slow,
        duration        = 3.0333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.CombatIdle00,
        anim_rate       = 0.1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["TellStoryLoop"] = {
        name            = ActionName.TellStoryLoop,
        duration        = 6.667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteTellStory,
        anim_rate       = nil,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["GreetingLoop"] = {
        name            = ActionName.GreetingLoop,
        duration        = 2.7,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteGreeting,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["KissLoop"] = {
        name            = ActionName.KissLoop,
        duration        = 3.2333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteKiss,
        anim_rate       = 0.75,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["ChatLoop"] = {
        name            = ActionName.ChatLoop,
        duration        = 3.9333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteChat,
        anim_rate       = 1,
        looping         = true,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Help"] = {
        name            = ActionName.Help,
        duration        = 4.2,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteCallForHelp,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Facepalm"] = {
        name            = ActionName.Facepalm,
        duration        = 3.9333,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteSad,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
    ["Rude"] = {
        name            = ActionName.Rude,
        duration        = 1.8667,
        reaction_type   = ReactionType.SINGLE,
        reaction_radius = 6,
        anim_name       = AnimName.EmoteUpYours,
        anim_rate       = 1,
        looping         = false,
        icon_name       = IconName.UI_Otherland_Misc_ITEM_PlaceHolderIcon,
    },
}

---@type table<EmoteGroupName, EmoteGroup>
local EmoteGroups = {
    ["Dance"] = {
        name    = EmoteGroupName.Dance,
        actions = { "FunkyChickenDance", "GroovingDance", "ThrillerDance", "WormDance", "MaleDance01", "MaleDance02" },
    },
    ["Greeting"] = {
        name    = EmoteGroupName.Greeting,
        actions = { "Giggle" },
    },
    ["Joke"] = {
        name    = EmoteGroupName.Joke,
        actions = { "Chicken", "PanicRun" },
    },
    ["Talk"] = {
        name    = EmoteGroupName.Talk,
        actions = { "Talk1", "Talk2", "Talk3" },
    },
    ["Offend"] = {
        name    = EmoteGroupName.Offend,
        actions = { "Angry", "ShutUp" },
    },
    ["Friendly"] = {
        name    = EmoteGroupName.Friendly,
        actions = { "Talk1", "Talk2", "Talk3", "Agree", "Giggle", "Applause", "LaughFast", "Greeting", "Laugh" },
    },
    ["Neutral"] = {
        name    = EmoteGroupName.Neutral,
        actions = { "Listening", "IdleMaleRelaxed", "IdleMaleLookAround", "IdleMaleStretchShoulders", "IdleScratchHip", "IdleScratchHead", "Yawn", "Shrug" },
    },
    ["Neutral Female"] = {
        name    = EmoteGroupName.Neutral_Female,
        actions = { "IdleFemaleRelaxed", "Shrug", "Yawn", "IdleMaleLookAround" },
    },
    ["Arrogant"] = {
        name    = EmoteGroupName.Arrogant,
        actions = { "Agree", "ShutUp", "IdleMaleDustOff", "ShrugFast", "Shrug", "FlippingTheBird01" },
    },
    ["Aggressive"] = {
        name    = EmoteGroupName.Aggressive,
        actions = { "drawWeapon", "ShutUp", "Angry", "AngryFast" },
    },
    ["Guard"] = {
        name    = EmoteGroupName.Guard,
        actions = { "Disagree", "Scold", "PointForward", "ListeningLoop", "Angry", "ThumbsDown" },
    },
    ["Vendor"] = {
        name    = EmoteGroupName.Vendor,
        actions = { "Talk1", "Talk2", "Talk3", "Agree", "Beckon", "ThumbsUp" },
    },
}

---@type table<string, ReactionScheme>
local ReactionSchemes = {
    ["DefaultGroups"] = {
        name    = ReactionSchemeName.DefaultGroups,
        inherit = nil,
        friendly = {
            default_messages = { "Yipee" },
            plans = {
                {
                    trigger_groups = { "Greeting" },
                    trigger_keywords_any = { "cleaning" },
                    output_actions = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "BartenderIdle_Cleaning" },
                        },
                    },
                },
                {
                    trigger_groups = { "Dance" },
                    trigger_keywords_any = { "dance" },
                    trigger_keywords_exact = { "good night" },
                    trigger_keywords_all = { "good", "morning" },
                    output_groups = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "Dance" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "Yipee" },
            plans = {
                {
                    trigger_groups = { "Greeting" },
                    trigger_keywords_any = { "cleaning" },
                    output_actions = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "BartenderIdle_Cleaning" },
                        },
                    },
                },
                {
                    trigger_groups = { "Dance" },
                    trigger_keywords_any = { "dance" },
                    trigger_keywords_exact = { "good night" },
                    trigger_keywords_all = { "good", "morning" },
                    output_groups = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "Dance" },
                        },
                    },
                },
            },
        },
    },
    ["Civilian"] = {
        name    = ReactionSchemeName.Civilian,
        inherit = "DefaultGroups",
        friendly = {
            default_messages = { "Xabbu-Friendly01" },
            plans = {
            },
        },
        neutral = {
            default_messages = { "Xabbu-Friendly01" },
            plans = {
            },
        },
    },
    ["CivilianPolite"] = {
        name    = ReactionSchemeName.CivilianPolite,
        inherit = "Civilian",
        friendly = {
            default_messages = {},
            plans = {
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["BarDoorBouncer"] = {
        name    = ReactionSchemeName.BarDoorBouncer,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    trigger_keywords_exact = { "havebaraccess" },
                    output_actions = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "HaveBarAccess" },
                        },
                    },
                },
                {
                    trigger_keywords_exact = { "nobaraccess" },
                    output_actions = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "NoBarAccess" },
                        },
                    },
                },
                {
                    trigger_actions = { "ThumbsUp" },
                    output_actions = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "ThumbsUp" },
                        },
                    },
                },
                {
                    trigger_actions = { "ThumbsDown" },
                    output_actions = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "ThumbsDown" },
                            { weight = 1, value = "NoBarAccess" },
                        },
                    },
                },
                {
                    proximity_range = 3,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    trigger_keywords_exact = { "havebaraccess" },
                    output_actions = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "HaveBarAccess" },
                        },
                    },
                },
                {
                    trigger_keywords_exact = { "nobaraccess" },
                    output_actions = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "NoBarAccess" },
                        },
                    },
                },
                {
                    trigger_actions = { "ThumbsUp" },
                    output_actions = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "ThumbsUp" },
                        },
                    },
                },
                {
                    trigger_actions = { "ThumbsDown" },
                    output_actions = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "ThumbsDown" },
                            { weight = 1, value = "NoBarAccess" },
                        },
                    },
                },
                {
                    proximity_range = 3,
                },
            },
        },
    },
    ["BartenderEnglishPub"] = {
        name    = ReactionSchemeName.BartenderEnglishPub,
        inherit = "BartenderDefault",
        friendly = {
            default_messages = { "LambdaMall-Bartender-EnglishPub-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-EnglishPub-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-EnglishPub-Aggressive01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-EnglishPub-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-EnglishPub-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-EnglishPub-Aggressive01" },
                        },
                    },
                },
            },
        },
    },
    ["BartenderBinary"] = {
        name    = ReactionSchemeName.BartenderBinary,
        inherit = "BartenderDefault",
        friendly = {
            default_messages = { "LambdaMall-Bartender-Binary-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Binary-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Binary-Aggressive01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-Binary-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Binary-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Binary-Aggressive01" },
                        },
                    },
                },
            },
        },
    },
    ["BartenderAbattoir"] = {
        name    = ReactionSchemeName.BartenderAbattoir,
        inherit = "BartenderDefault",
        friendly = {
            default_messages = { "LambdaMall-Bartender-Abattoir-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Abattoir-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Abattoir-Friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Abattoir-Aggressive01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-Abattoir-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Abattoir-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Abattoir-Friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Abattoir-Aggressive01" },
                        },
                    },
                },
            },
        },
    },
    ["Bartender8Squared"] = {
        name    = ReactionSchemeName.Bartender8Squared,
        inherit = "BartenderDefault",
        friendly = {
            default_messages = { "LambdaMall-Bartender-Bar8Square-Friendly01", "LambdaMall-Bartender-Bar8Square-Friendly02", "LambdaMall-Bartender-Bar8Square-Friendly03" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Neutral02" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Neutral03" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Neutral04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Aggressive02" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-Bar8Square-Friendly01", "LambdaMall-Bartender-Bar8Square-Friendly02", "LambdaMall-Bartender-Bar8Square-Friendly03" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Neutral02" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Neutral03" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Neutral04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Aggressive02" },
                        },
                    },
                },
            },
        },
    },
    ["BartenderBlackRoom"] = {
        name    = ReactionSchemeName.BartenderBlackRoom,
        inherit = "BartenderDefault",
        friendly = {
            default_messages = { "LambdaMall-Bartender-BlackRoom-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-BlackRoom-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-BlackRoom-Aggressive01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-BlackRoom-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-BlackRoom-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-BlackRoom-Aggressive01" },
                        },
                    },
                },
            },
        },
    },
    ["BartenderBlueNote"] = {
        name    = ReactionSchemeName.BartenderBlueNote,
        inherit = "BartenderDefault",
        friendly = {
            default_messages = { "LambdaMall-Bartender-BlueNote-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-BlueNote-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-BlueNote-Aggressive01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-BlueNote-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-BlueNote-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-BlueNote-Aggressive01" },
                        },
                    },
                },
            },
        },
    },
    ["BartenderClub101"] = {
        name    = ReactionSchemeName.BartenderClub101,
        inherit = "BartenderDefault",
        friendly = {
            default_messages = { "LambdaMall-Bartender-Club101-Friendly01", "LambdaMall-Bartender-Club101-Friendly02" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Club101-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Club101-Neutral02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Club101-Aggressive01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-Club101-Friendly01", "LambdaMall-Bartender-Club101-Friendly02" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Club101-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Club101-Neutral02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Club101-Aggressive01" },
                        },
                    },
                },
            },
        },
    },
    ["BartenderDJOcto"] = {
        name    = ReactionSchemeName.BartenderDJOcto,
        inherit = "BartenderDefault",
        friendly = {
            default_messages = { "LambdaMall-Bartender-DJOcto-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-DJOcto-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-DJOcto-Aggressive01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-DJOcto-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-DJOcto-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-DJOcto-Aggressive01" },
                        },
                    },
                },
            },
        },
    },
    ["BartenderDogfight"] = {
        name    = ReactionSchemeName.BartenderDogfight,
        inherit = "BartenderDefault",
        friendly = {
            default_messages = { "LambdaMall-Bartender-DogFight-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-DogFight-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-DogFight-Aggressive01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-DogFight-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-DogFight-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-DogFight-Aggressive01" },
                        },
                    },
                },
            },
        },
    },
    ["BartenderLoveNurseClinic"] = {
        name    = ReactionSchemeName.BartenderLoveNurseClinic,
        inherit = "BartenderDefault",
        friendly = {
            default_messages = { "LambdaMall-Bartender-LoveNurseClinic-Neutral01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-LoveNurseClinic-Friendly01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-LoveNurseClinic-Aggressive01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-LoveNurseClinic-Neutral01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-LoveNurseClinic-Friendly01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-LoveNurseClinic-Aggressive01" },
                        },
                    },
                },
            },
        },
    },
    ["BartenderPetals"] = {
        name    = ReactionSchemeName.BartenderPetals,
        inherit = "BartenderDefault",
        friendly = {
            default_messages = { "LambdaMall-Bartender-Petals-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Petals-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Petals-Aggressive01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-Petals-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Petals-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Petals-Aggressive01" },
                        },
                    },
                },
            },
        },
    },
    ["BartenderRoswell"] = {
        name    = ReactionSchemeName.BartenderRoswell,
        inherit = "BartenderDefault",
        friendly = {
            default_messages = { "LambdaMall-Bartender-Roswell-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Roswell-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Roswell-Aggressive01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-Roswell-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Roswell-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Roswell-Aggressive01" },
                        },
                    },
                },
            },
        },
    },
    ["BartenderTonyPlus"] = {
        name    = ReactionSchemeName.BartenderTonyPlus,
        inherit = "BartenderDefault",
        friendly = {
            default_messages = { "LambdaMall-Bartender-TonyPlus-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-TonyPlus-Friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-TonyPlus-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-TonyPlus-Aggressive02" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-TonyPlus-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-TonyPlus-Friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-TonyPlus-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-TonyPlus-Aggressive02" },
                        },
                    },
                },
            },
        },
    },
    ["BartenderZebra"] = {
        name    = ReactionSchemeName.BartenderZebra,
        inherit = "BartenderDefault",
        friendly = {
            default_messages = { "LambdaMall-Bartender-Zebra-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Zebra-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Zebra-Aggressive01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-Zebra-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Zebra-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Zebra-Aggressive01" },
                        },
                    },
                },
            },
        },
    },
    ["BartenderDefault"] = {
        name    = ReactionSchemeName.BartenderDefault,
        inherit = nil,
        friendly = {
            default_messages = { "LambdaMall-Bartender-Abattoir-Friendly01", "LambdaMall-Bartender-Bar8Square-Friendly01", "LambdaMall-Bartender-Bar8Square-Friendly03", "LambdaMall-Bartender-Binary-Friendly01", "LambdaMall-Bartender-BlackRoom-Friendly01", "LambdaMall-Bartender-Club101-Friendly01", "LambdaMall-Bartender-Club101-Friendly02", "LambdaMall-Bartender-DJOcto-Friendly01", "LambdaMall-Bartender-EnglishPub-Friendly01", "LambdaMall-Bartender-Petals-Friendly01", "LambdaMall-Bartender-TonyPlus-Friendly01", "LambdaMall-Bartender-TonyPlus-Friendly02", "LambdaMall-Bartender-Zebra-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Abattoir-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Neutral02" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Neutral04" },
                            { weight = 1, value = "LambdaMall-Bartender-Binary-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-BlackRoom-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-BlueNote-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Club101-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Club101-Neutral02" },
                            { weight = 1, value = "LambdaMall-Bartender-DJOcto-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-EnglishPub-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-LoveNurseClinic-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Petals-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-TonyPlus-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Abattoir-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Aggressive02" },
                            { weight = 1, value = "LambdaMall-Bartender-BlackRoom-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-Club101-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-DJOcto-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-EnglishPub-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-Petals-Aggressive01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-Abattoir-Friendly01", "LambdaMall-Bartender-Bar8Square-Friendly01", "LambdaMall-Bartender-Bar8Square-Friendly03", "LambdaMall-Bartender-Binary-Friendly01", "LambdaMall-Bartender-BlackRoom-Friendly01", "LambdaMall-Bartender-Club101-Friendly01", "LambdaMall-Bartender-Club101-Friendly02", "LambdaMall-Bartender-DJOcto-Friendly01", "LambdaMall-Bartender-EnglishPub-Friendly01", "LambdaMall-Bartender-Petals-Friendly01", "LambdaMall-Bartender-TonyPlus-Friendly01", "LambdaMall-Bartender-TonyPlus-Friendly02", "LambdaMall-Bartender-Zebra-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Abattoir-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Neutral02" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Neutral04" },
                            { weight = 1, value = "LambdaMall-Bartender-Binary-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-BlackRoom-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-BlueNote-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Club101-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Club101-Neutral02" },
                            { weight = 1, value = "LambdaMall-Bartender-DJOcto-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-EnglishPub-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-LoveNurseClinic-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-Petals-Neutral01" },
                            { weight = 1, value = "LambdaMall-Bartender-TonyPlus-Neutral01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-Abattoir-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-Bar8Square-Aggressive02" },
                            { weight = 1, value = "LambdaMall-Bartender-BlackRoom-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-Club101-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-DJOcto-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-EnglishPub-Aggressive01" },
                            { weight = 1, value = "LambdaMall-Bartender-Petals-Aggressive01" },
                        },
                    },
                },
            },
        },
    },
    ["RichWife"] = {
        name    = ReactionSchemeName.RichWife,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    trigger_keywords_any = { "Hello Hi Gidday Hiya" },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    trigger_keywords_any = { "Hello Hi Gidday Hiya" },
                },
            },
        },
    },
    ["OysterhouseKid"] = {
        name    = ReactionSchemeName.OysterhouseKid,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-OysterhouseOrphan-Default01", "8Squared-OysterhouseOrphan-Default02", "8Squared-OysterhouseOrphan-Default03", "8Squared-OysterhouseOrphan-Default04", "8Squared-OysterhouseOrphan-Default05" },
            plans = {
                {
                    proximity_range = 2,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Proximity01" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Proximity02" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Proximity03" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Proximity04" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Proximity05" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Wait01" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Wait02" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Wait03" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Wait04" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Wait05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-OysterhouseOrphan-Default01", "8Squared-OysterhouseOrphan-Default02", "8Squared-OysterhouseOrphan-Default03", "8Squared-OysterhouseOrphan-Default04", "8Squared-OysterhouseOrphan-Default05" },
            plans = {
                {
                    proximity_range = 2,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Proximity01" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Proximity02" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Proximity03" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Proximity04" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Proximity05" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Wait01" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Wait02" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Wait03" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Wait04" },
                            { weight = 1, value = "8Squared-OysterhouseOrphan-Wait05" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterAdventureInc"] = {
        name    = ReactionSchemeName.ShopPromoterAdventureInc,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-Adventure-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-Adventure-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-Adventure-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-Adventure-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-Adventure-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-Adventure-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-Adventure-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-Adventure-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-Adventure-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-Adventure-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterArmsAGettin"] = {
        name    = ReactionSchemeName.ShopPromoterArmsAGettin,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-ArmsAGettin-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-ArmsAGettin-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-ArmsAGettin-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-ArmsAGettin-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-ArmsAGettin-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-ArmsAGettin-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-ArmsAGettin-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-ArmsAGettin-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-ArmsAGettin-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-ArmsAGettin-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterBlingItOn"] = {
        name    = ReactionSchemeName.ShopPromoterBlingItOn,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-BlingItOn-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-BlingItOn-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-BlingItOn-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-BlingItOn-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-BlingItOn-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-BlingItOn-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-BlingItOn-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-BlingItOn-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-BlingItOn-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-BlingItOn-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterClass"] = {
        name    = ReactionSchemeName.ShopPromoterClass,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-Class-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-Class-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-Class-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-Class-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-Class-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-Class-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-Class-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-Class-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-Class-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-Class-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterExpressYourself"] = {
        name    = ReactionSchemeName.ShopPromoterExpressYourself,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-ExpressYourself-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-ExpressYourself-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-ExpressYourself-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-ExpressYourself-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-ExpressYourself-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-ExpressYourself-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-ExpressYourself-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-ExpressYourself-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-ExpressYourself-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-ExpressYourself-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterTheDataStore"] = {
        name    = ReactionSchemeName.ShopPromoterTheDataStore,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-TheDataStore-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheDataStore-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheDataStore-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheDataStore-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheDataStore-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-TheDataStore-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheDataStore-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheDataStore-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheDataStore-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheDataStore-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterGoThereDoThat"] = {
        name    = ReactionSchemeName.ShopPromoterGoThereDoThat,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-GoThereDoThat-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-GoThereDoThat-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-GoThereDoThat-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-GoThereDoThat-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-GoThereDoThat-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-GoThereDoThat-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-GoThereDoThat-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-GoThereDoThat-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-GoThereDoThat-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-GoThereDoThat-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterHackerShop"] = {
        name    = ReactionSchemeName.ShopPromoterHackerShop,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-HackerShop-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-HackerShop-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-HackerShop-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-HackerShop-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-HackerShop-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-HackerShop-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-HackerShop-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-HackerShop-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-HackerShop-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-HackerShop-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterLuckyUp"] = {
        name    = ReactionSchemeName.ShopPromoterLuckyUp,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-LuckyUp-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-LuckyUp-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-LuckyUp-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-LuckyUp-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-LuckyUp-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-LuckyUp-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-LuckyUp-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-LuckyUp-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-LuckyUp-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-LuckyUp-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterAttractBase"] = {
        name    = ReactionSchemeName.ShopPromoterAttractBase,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["ShopPromoterThankBase"] = {
        name    = ReactionSchemeName.ShopPromoterThankBase,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["ShopPromoterMetamorph"] = {
        name    = ReactionSchemeName.ShopPromoterMetamorph,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-Metamorph-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-Metamorph-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-Metamorph-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-Metamorph-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-Metamorph-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-Metamorph-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-Metamorph-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-Metamorph-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-Metamorph-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-Metamorph-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterNouveauMonde"] = {
        name    = ReactionSchemeName.ShopPromoterNouveauMonde,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-NouveauMonde-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-NouveauMonde-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-NouveauMonde-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-NouveauMonde-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-NouveauMonde-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-NouveauMonde-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-NouveauMonde-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-NouveauMonde-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-NouveauMonde-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-NouveauMonde-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterShowItOff"] = {
        name    = ReactionSchemeName.ShopPromoterShowItOff,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-ShowItOff-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-ShowItOff-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-ShowItOff-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-ShowItOff-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-ShowItOff-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-ShowItOff-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-ShowItOff-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-ShowItOff-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-ShowItOff-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-ShowItOff-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterTheGathering"] = {
        name    = ReactionSchemeName.ShopPromoterTheGathering,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-TheGathering-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheGathering-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheGathering-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheGathering-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheGathering-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-TheGathering-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheGathering-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheGathering-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheGathering-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-TheGathering-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterSomaForge"] = {
        name    = ReactionSchemeName.ShopPromoterSomaForge,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-SomaForge-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-SomaForge-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-SomaForge-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-SomaForge-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-SomaForge-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-SomaForge-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-SomaForge-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-SomaForge-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-SomaForge-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-SomaForge-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["BarPromoterBlueNoteJazzClub"] = {
        name    = ReactionSchemeName.BarPromoterBlueNoteJazzClub,
        inherit = nil,
        friendly = {
            default_messages = { "LambdaMall-BarPromoter-BlueNoteJazzClub-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-BlueNoteJazzClub-Friendly02" },
                            { weight = 1, value = "LambdaMall-BarPromoter-BlueNoteJazzClub-Friendly03" },
                            { weight = 1, value = "LambdaMall-BarPromoter-BlueNoteJazzClub-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-BlueNoteJazzClub-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-BarPromoter-BlueNoteJazzClub-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-BlueNoteJazzClub-Friendly02" },
                            { weight = 1, value = "LambdaMall-BarPromoter-BlueNoteJazzClub-Friendly03" },
                            { weight = 1, value = "LambdaMall-BarPromoter-BlueNoteJazzClub-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-BlueNoteJazzClub-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["BarPromoterDJOctoMiniGame"] = {
        name    = ReactionSchemeName.BarPromoterDJOctoMiniGame,
        inherit = nil,
        friendly = {
            default_messages = { "LambdaMall-BarPromoter-DJOctoMiniGame-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-DJOctoMiniGame-Friendly02" },
                            { weight = 1, value = "LambdaMall-BarPromoter-DJOctoMiniGame-Friendly03" },
                            { weight = 1, value = "LambdaMall-BarPromoter-DJOctoMiniGame-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-DJOctoMiniGame-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-BarPromoter-DJOctoMiniGame-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-DJOctoMiniGame-Friendly02" },
                            { weight = 1, value = "LambdaMall-BarPromoter-DJOctoMiniGame-Friendly03" },
                            { weight = 1, value = "LambdaMall-BarPromoter-DJOctoMiniGame-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-DJOctoMiniGame-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["BarPromoterDogfightMiniGame"] = {
        name    = ReactionSchemeName.BarPromoterDogfightMiniGame,
        inherit = nil,
        friendly = {
            default_messages = { "LambdaMall-BarPromoter-DogfightMiniGame-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-DogfightMiniGame-Friendly02" },
                            { weight = 1, value = "LambdaMall-BarPromoter-DogfightMiniGame-Friendly03" },
                            { weight = 1, value = "LambdaMall-BarPromoter-DogfightMiniGame-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall_BarPromoter-DogfightMiniGame-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-BarPromoter-DogfightMiniGame-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-DogfightMiniGame-Friendly02" },
                            { weight = 1, value = "LambdaMall-BarPromoter-DogfightMiniGame-Friendly03" },
                            { weight = 1, value = "LambdaMall-BarPromoter-DogfightMiniGame-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall_BarPromoter-DogfightMiniGame-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["BarPromoterEnglishPubMiniGame"] = {
        name    = ReactionSchemeName.BarPromoterEnglishPubMiniGame,
        inherit = nil,
        friendly = {
            default_messages = { "LambdaMall-BarPromoter-EnglishMiniGame-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-EnglishMiniGame-Friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-EnglishMiniGame-Friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-BarPromoter-EnglishMiniGame-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-EnglishMiniGame-Friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-EnglishMiniGame-Friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["BarPromoter8Squared"] = {
        name    = ReactionSchemeName.BarPromoter8Squared,
        inherit = nil,
        friendly = {
            default_messages = { "LambdaMall-BarPromoter-EightSquared-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-EightSquared-Friendly02" },
                            { weight = 1, value = "LambdaMall-BarPromoter-EightSquared-Friendly03" },
                            { weight = 1, value = "LambdaMall-BarPromoter-EightSquared-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-EightSquared-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-BarPromoter-EightSquared-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-EightSquared-Friendly02" },
                            { weight = 1, value = "LambdaMall-BarPromoter-EightSquared-Friendly03" },
                            { weight = 1, value = "LambdaMall-BarPromoter-EightSquared-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-EightSquared-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["BarPromoterRoswellMiniGame"] = {
        name    = ReactionSchemeName.BarPromoterRoswellMiniGame,
        inherit = nil,
        friendly = {
            default_messages = { "LambdaMall-BarPromoter-RoswellMiniGame-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-RoswellMiniGame-Friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-RoswellMiniGame-Friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-BarPromoter-RoswellMiniGame-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-RoswellMiniGame-Friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-RoswellMiniGame-Friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-AdmiralBurtonWindsorSmythe"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_AdmiralBurtonWindsorSmythe,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-AdmiralBurtonWindsorSmythe-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-AdmiralBurtonWindsorSmythe-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-AdmiralBurtonWindsorSmythe-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-AdmiralBurtonWindsorSmythe-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-AdmiralBurtonWindsorSmythe-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-AdmiralBurtonWindsorSmythe-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-BoatmenOnTheRiver"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_BoatmenOnTheRiver,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-BoatmenontheRiver-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BoatmenontheRiver-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BoatmenontheRiver-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-BoatmenontheRiver-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BoatmenontheRiver-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BoatmenontheRiver-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-CourtiersoftheWhitePrincess"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_CourtiersoftheWhitePrincess,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-CourtiersoftheWhitePrincess-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-CourtiersoftheWhitePrincess-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-CourtiersoftheWhitePrincess-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-CourtiersoftheWhitePrincess-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-CourtiersoftheWhitePrincess-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-CourtiersoftheWhitePrincess-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-CourtiersoftheRedQueen"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_CourtiersoftheRedQueen,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-CourtiersoftheRedQueen-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-CourtiersoftheRedQueen-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-CourtiersoftheRedQueen-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-CourtiersoftheRedQueen-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-CourtiersoftheRedQueen-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-CourtiersoftheRedQueen-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-DrKinski"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_DrKinski,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-DrKinski-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-DrKinski-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-DrKinski-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-DrKinski-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-DrKinski-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-DrKinski-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-Gleaners"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_Gleaners,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-Gleaners-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Gleaners-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Gleaners-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-Gleaners-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Gleaners-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Gleaners-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-GlenburnRebels"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_GlenburnRebels,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-GlenburnRebels-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-GlenburnRebels-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-GrangertheBlacksmith"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_GrangertheBlacksmith,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-GrangertheBlacksmith-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GrangertheBlacksmith-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GrangertheBlacksmith-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-GrangertheBlacksmith-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GrangertheBlacksmith-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GrangertheBlacksmith-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-GreatTimeMaster"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_GreatTimeMaster,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-GreatTimeMaster-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GreatTimeMaster-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GreatTimeMaster-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-GreatTimeMaster-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GreatTimeMaster-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GreatTimeMaster-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-HumungousFungusSpecialDefenceUnit"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_HumungousFungusSpecialDefenceUnit,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-HumungousFungusSpecialDefenceUnit-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-HumungousFungusSpecialDefenceUnit-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-HumungousFungusSpecialDefenceUnit-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-HumungousFungusSpecialDefenceUnit-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-HumungousFungusSpecialDefenceUnit-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-HumungousFungusSpecialDefenceUnit-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-LordDrake"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_LordDrake,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-LordDrake-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-LordDrake-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-LordDrake-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-LordDrake-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-LordDrake-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-LordDrake-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-Millers"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_Millers,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-Millers-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Millers-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Millers-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-Millers-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Millers-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Millers-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-MushroomPygmySage"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_MushroomPygmySage,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-MushroomPygmySage-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MushroomPygmySage-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MushroomPygmySage-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-MushroomPygmySage-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MushroomPygmySage-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MushroomPygmySage-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-OrphanGirls"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_OrphanGirls,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-OrphanGirls-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-OrphanGirls-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-OrphanGirls-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-OrphanGirls-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-OrphanGirls-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-OrphanGirls-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-ReclantTheHermit"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_ReclantTheHermit,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-ReclanttheHermit-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ReclanttheHermit-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ReclanttheHermit-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-ReclanttheHermit-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ReclanttheHermit-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ReclanttheHermit-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-ServantMaids"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_ServantMaids,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-ServantMaids-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ServantMaids-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ServantMaids-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-ServantMaids-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ServantMaids-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ServantMaids-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-StudentsOfTheAcademy"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_StudentsOfTheAcademy,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-StudentsoftheAcademy-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-StudentsoftheAcademy-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-StudentsoftheAcademy-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-StudentsoftheAcademy-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-StudentsoftheAcademy-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-StudentsoftheAcademy-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-Shopkeepers"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_Shopkeepers,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-Shopkeepers-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-Shopkeepers-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-TravelingVendor"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_TravelingVendor,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-TravelingSalesmen-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-TravelingSalesmen-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-TravelingSalesmen-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-TravelingSalesmen-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-TravelingSalesmen-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-TravelingSalesmen-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-WhitePrincess"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_WhitePrincess,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-WhitePrincess-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 5, value = "8Squared-NonCombatAIBiped-WhitePrincess-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-WhitePrincess-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-WhitePrincess-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 5, value = "8Squared-NonCombatAIBiped-WhitePrincess-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-WhitePrincess-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-BoatmanOnTheRiver0"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_BoatmanOnTheRiver0,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-BoatmenontheRiver-friendly02" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BoatmenontheRiver-friendly03" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BoatmenontheRiver-friendly01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-BoatmenontheRiver-friendly02" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BoatmenontheRiver-friendly03" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BoatmenontheRiver-friendly01" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-Shopkeeper0"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_Shopkeeper0,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-Shopkeepers-friendly02" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly03" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-Shopkeepers-friendly02" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly03" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly01" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-Shopkeeper1"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_Shopkeeper1,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-Shopkeepers-friendly03" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-Shopkeepers-friendly03" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly01" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-Shopkeeper2"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_Shopkeeper2,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-Shopkeepers-friendly02" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-Shopkeepers-friendly02" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Shopkeepers-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-GlenburnRebel0"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_GlenburnRebel0,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-GlenburnRebels-friendly02" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly03" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-GlenburnRebels-friendly02" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly03" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly01" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-GlenburnRebel1"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_GlenburnRebel1,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-GlenburnRebels-friendly03" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-GlenburnRebels-friendly03" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly01" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-GlenburnRebel2"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_GlenburnRebel2,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-GlenburnRebels-friendly03" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly02" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-GlenburnRebels-friendly03" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly01" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-GlenburnRebels-friendly02" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-ServantMaid0"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_ServantMaid0,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-ServantMaids-friendly02" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ServantMaids-friendly03" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ServantMaids-friendly01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-ServantMaids-friendly02" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ServantMaids-friendly03" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ServantMaids-friendly01" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-ServantMaid1"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_ServantMaid1,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-Shopkeepers-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ServantMaids-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ServantMaids-friendly01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-Shopkeepers-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ServantMaids-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-ServantMaids-friendly01" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-WhiteArmySoldiersOnLeave"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_WhiteArmySoldiersOnLeave,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-WhiteArmySoldieronLeave-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-WhiteArmySoldieronLeave-friendly02" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-WhiteArmySoldieronLeave-friendly03" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-WhiteArmySoldieronLeave-friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-WhiteArmySoldieronLeave-friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-WhiteArmySoldieronLeave-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-WhiteArmySoldieronLeave-friendly02" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-WhiteArmySoldieronLeave-friendly03" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-WhiteArmySoldieronLeave-friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-WhiteArmySoldieronLeave-friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-Insurgents"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_Insurgents,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-Insurgents-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Insurgents-friendly02" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Insurgents-friendly03" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Insurgents-friendly04" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Insurgents-friendly05" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Insurgents-friendly06" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-Insurgents-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Insurgents-friendly02" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Insurgents-friendly03" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Insurgents-friendly04" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Insurgents-friendly05" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Insurgents-friendly06" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-Spies"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_Spies,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-Spies-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Spies-friendly02" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Spies-friendly03" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Spies-friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Spies-friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-Spies-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Spies-friendly02" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Spies-friendly03" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Spies-friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Spies-friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-Florist0"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_Florist0,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-Florists-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Florists-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Florists-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-Florists-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Florists-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Florists-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-RichWife"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_RichWife,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-RichWife-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-RichWife-friendly02" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-RichWife-friendly03" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-RichWife-friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-RichWife-friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-RichWife-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-RichWife-friendly02" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-RichWife-friendly03" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-RichWife-friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-RichWife-friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-FemalePeasant"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_FemalePeasant,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-FemalePeasant-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FemalePeasant-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FemalePeasant-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-FemalePeasant-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FemalePeasant-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FemalePeasant-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-MalePeasant"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_MalePeasant,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-MalePeasant-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MalePeasant-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MalePeasant-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-MalePeasant-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MalePeasant-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MalePeasant-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-FemaleVillagers"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_FemaleVillagers,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-FemaleVillagers-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FemaleVillagers-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FemaleVillagers-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-FemaleVillagers-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FemaleVillagers-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FemaleVillagers-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-MaleVillagers"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_MaleVillagers,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-MaleVillagers-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MaleVillagers-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MaleVillagers-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-MaleVillagers-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MaleVillagers-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MaleVillagers-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-Florist1"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_Florist1,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-Florists-friendly04" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Florists-friendly05" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Florists-friendly01" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-Florists-friendly04" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Florists-friendly05" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Florists-friendly01" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-Florist2"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_Florist2,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-Florists-friendly02", "8Squared-NonCombatAIBiped-Florists-friendly03" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Florists-friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Florists-friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-Florists-friendly02", "8Squared-NonCombatAIBiped-Florists-friendly03" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Florists-friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Florists-friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-FarmerChamManklins"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_FarmerChamManklins,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-FarmerChamManklins-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FarmerChamManklins-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FarmerChamManklins-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-FarmerChamManklins-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FarmerChamManklins-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FarmerChamManklins-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-FarmerSellaManklins"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_FarmerSellaManklins,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-FarmerSellaManklins-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FarmerSellaManklins-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FarmerSellaManklins-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-FarmerSellaManklins-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FarmerSellaManklins-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FarmerSellaManklins-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-OrphanBoy0"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_OrphanBoy0,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-OrphanBoys-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-OrphanBoys-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-OrphanBoys-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-OrphanBoys-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-OrphanBoys-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-OrphanBoys-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-FishermanJerridJenks"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_FishermanJerridJenks,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-FishermanJerridJenks-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FishermanJerridJenks-friendly02" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FishermanJerridJenks-friendly03" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FishermanJerridJenks-friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FishermanJerridJenks-friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-FishermanJerridJenks-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FishermanJerridJenks-friendly02" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FishermanJerridJenks-friendly03" },
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FishermanJerridJenks-friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FishermanJerridJenks-friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-FishermanOlFrang"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_FishermanOlFrang,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-FishermanOlFrang-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FishermanOlFrang-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FishermanOlFrang-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-FishermanOlFrang-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FishermanOlFrang-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-FishermanOlFrang-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-InnkeeperGeneral"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_InnkeeperGeneral,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-InnkeeperGeneral-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-InnkeeperGeneral-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-InnkeeperGeneral-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-InnkeeperGeneral-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-InnkeeperGeneral-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-InnkeeperGeneral-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-InnkeeperFishgut"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_InnkeeperFishgut,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-InnkeeperFishgut-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-InnkeeperFishgut-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-InnkeeperFishgut-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-InnkeeperFishgut-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-InnkeeperFishgut-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-InnkeeperFishgut-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-InnkeeperTroopersRest"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_InnkeeperTroopersRest,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-InnkeeperTroopersRest-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-InnkeeperTroopersRest-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-InnkeeperTroopersRest-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-InnkeeperTroopersRest-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-InnkeeperTroopersRest-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-InnkeeperTroopersRest-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-Beggars"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_Beggars,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-Beggars-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Beggars-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Beggars-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-Beggars-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Beggars-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Beggars-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-Burgher0"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_Burgher0,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-Burghers-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Burghers-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Burghers-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-Burghers-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Burghers-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Burghers-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-Burgher1"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_Burgher1,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-Burghers-friendly03" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Burghers-friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Burghers-friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-Burghers-friendly03" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Burghers-friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-Burghers-friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-IronmongerOfTheForge"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_IronmongerOfTheForge,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-IronmongeroftheForge-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-IronmongeroftheForge-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-IronmongeroftheForge-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-IronmongeroftheForge-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-IronmongeroftheForge-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-IronmongeroftheForge-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-MayorOfBerkHampstead"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_MayorOfBerkHampstead,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-MayorofBerkHampstead-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorofBerkHampstead-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorofBerkHampstead-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-MayorofBerkHampstead-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorofBerkHampstead-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorofBerkHampstead-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-MayorOfFlowerdale"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_MayorOfFlowerdale,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-MayorofFlowerdale-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorofFlowerdale-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorofFlowerdale-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-MayorofFlowerdale-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorofFlowerdale-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorofFlowerdale-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-MonksOfRavenMinster"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_MonksOfRavenMinster,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-MonksofRavenMinster-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MonksofRavenMinster-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MonksofRavenMinster-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-MonksofRavenMinster-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MonksofRavenMinster-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MonksofRavenMinster-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-MayorOfArcadia"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_MayorOfArcadia,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-MayorofAcadia-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorofAcadia-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorofAcadia-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-MayorofAcadia-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorofAcadia-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorofAcadia-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-MayorHardinOfRiverton"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_MayorHardinOfRiverton,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-MayorHardinofRiverton-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorHardinofRiverton-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorHardinofRiverton-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-MayorHardinofRiverton-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorHardinofRiverton-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MayorHardinofRiverton-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-BrotherLanquistOfStJacobs"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_BrotherLanquistOfStJacobs,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-AbbotLanquistofStJacobs-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-AbbotLanquistofStJacobs-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-AbbotLanquistofStJacobs-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-AbbotLanquistofStJacobs-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-AbbotLanquistofStJacobs-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-AbbotLanquistofStJacobs-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-BrotherJanneOfStJacobs"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_BrotherJanneOfStJacobs,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-BrotherJanneofStJacobs-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BrotherJanneofStJacobs-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BrotherJanneofStJacobs-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-BrotherJanneofStJacobs-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BrotherJanneofStJacobs-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BrotherJanneofStJacobs-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-BrotherJerridTiminasOfStJacobs"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_BrotherJerridTiminasOfStJacobs,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-BrotherJerridTiminasofStJacobs-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BrotherJerridTiminasofStJacobs-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BrotherJerridTiminasofStJacobs-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-BrotherJerridTiminasofStJacobs-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BrotherJerridTiminasofStJacobs-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BrotherJerridTiminasofStJacobs-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-BrotherTemsOfStJacobs"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_BrotherTemsOfStJacobs,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-BrotherTemsofStJacobs-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BrotherTemsofStJacobs-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BrotherTemsofStJacobs-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-BrotherTemsofStJacobs-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BrotherTemsofStJacobs-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-BrotherTemsofStJacobs-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-RedMonks"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_RedMonks,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-RedMonks-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-RedMonks-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-RedMonks-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-RedMonks-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-RedMonks-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-RedMonks-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-NonCombatAIBiped-MonkOfTheGrail"] = {
        name    = ReactionSchemeName._8Squared_NonCombatAIBiped_MonkOfTheGrail,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-MonkoftheGrail-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MonkoftheGrail-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MonkoftheGrail-friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-MonkoftheGrail-friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MonkoftheGrail-friendly02" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-NonCombatAIBiped-MonkoftheGrail-friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["NPC_Friendly"] = {
        name    = ReactionSchemeName.NPC_Friendly,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-NonCombatAIBiped-InnkeeperFishgut-friendly02" },
            plans = {
                {
                    trigger_actions = { "ThrillerDance" },
                    proximity_range = 10,
                    output_actions = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "JapaneseBow" },
                        },
                    },
                    output_groups = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "Friendly" },
                        },
                    },
                },
                {
                    trigger_actions = { "FreakOut" },
                    wait_duration = 6,
                    output_groups = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "Friendly" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-NonCombatAIBiped-InnkeeperFishgut-friendly02" },
            plans = {
                {
                    trigger_actions = { "ThrillerDance" },
                    proximity_range = 10,
                    output_groups = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "Friendly" },
                        },
                    },
                },
                {
                    trigger_actions = { "FreakOut" },
                    wait_duration = 6,
                    output_groups = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "Friendly" },
                        },
                    },
                },
            },
        },
    },
    ["NPC_Neutral"] = {
        name    = ReactionSchemeName.NPC_Neutral,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["NPC_Arrogant"] = {
        name    = ReactionSchemeName.NPC_Arrogant,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["NPC_Aggressive"] = {
        name    = ReactionSchemeName.NPC_Aggressive,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["NPC_Crazy"] = {
        name    = ReactionSchemeName.NPC_Crazy,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["NPC_Paranoid"] = {
        name    = ReactionSchemeName.NPC_Paranoid,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["NPC_Stupid"] = {
        name    = ReactionSchemeName.NPC_Stupid,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["NPC_Enthusiastic"] = {
        name    = ReactionSchemeName.NPC_Enthusiastic,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["NPC_QuestGiver"] = {
        name    = ReactionSchemeName.NPC_QuestGiver,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["NPC_Vendor"] = {
        name    = ReactionSchemeName.NPC_Vendor,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    trigger_groups = { "Vendor" },
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["NPC_Aloof"] = {
        name    = ReactionSchemeName.NPC_Aloof,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["NPC_Timid"] = {
        name    = ReactionSchemeName.NPC_Timid,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["Bartender70sBar"] = {
        name    = ReactionSchemeName.Bartender70sBar,
        inherit = nil,
        friendly = {
            default_messages = { "LambdaMall-Bartender-70sBar-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-70sBar-Friendly02" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-70sBar-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-70sBar-Friendly02" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterMyBank"] = {
        name    = ReactionSchemeName.ShopPromoterMyBank,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-MyBank-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-MyBank-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-MyBank-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-MyBank-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-MyBank-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-MyBank-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-MyBank-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-MyBank-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-MyBank-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-MyBank-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["BarPromoterPermanentInk"] = {
        name    = ReactionSchemeName.BarPromoterPermanentInk,
        inherit = nil,
        friendly = {
            default_messages = { "LambdaMall-BarPromoter-PermanentInk-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-PermanentInk-Friendly03" },
                            { weight = 1, value = "LambdaMall-BarPromoter-PermanentInk-Friendly02" },
                            { weight = 1, value = "LambdaMall-BarPromoter-PermanentInk-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-PermanentInk-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-BarPromoter-PermanentInk-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-PermanentInk-Friendly03" },
                            { weight = 1, value = "LambdaMall-BarPromoter-PermanentInk-Friendly02" },
                            { weight = 1, value = "LambdaMall-BarPromoter-PermanentInk-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-PermanentInk-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["BarPromoter70sBar"] = {
        name    = ReactionSchemeName.BarPromoter70sBar,
        inherit = nil,
        friendly = {
            default_messages = { "LambdaMall-BarPromoter-70sBar-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-70sBar-Friendly02" },
                            { weight = 1, value = "LambdaMall-BarPromoter-70sBar-Friendly03" },
                            { weight = 1, value = "LambdaMall-BarPromoter-70sBar-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-70sBar-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-BarPromoter-70sBar-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-70sBar-Friendly02" },
                            { weight = 1, value = "LambdaMall-BarPromoter-70sBar-Friendly03" },
                            { weight = 1, value = "LambdaMall-BarPromoter-70sBar-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-BarPromoter-70sBar-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["BartenderPermanentInk"] = {
        name    = ReactionSchemeName.BartenderPermanentInk,
        inherit = nil,
        friendly = {
            default_messages = { "LambdaMall-Bartender-PermanentInk-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-PermanentInk-Friendly02" },
                            { weight = 1, value = "LambdaMall-Bartender-PermanentInk-Friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-Bartender-PermanentInk-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-Bartender-PermanentInk-Friendly02" },
                            { weight = 1, value = "LambdaMall-Bartender-PermanentInk-Friendly03" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterTraderJ"] = {
        name    = ReactionSchemeName.ShopPromoterTraderJ,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "LambdaMall-ShopPromoter-TraderJ-Friendly01" },
            plans = {
                {
                    proximity_range = nil,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-TraderJ-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-TraderJ-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-TraderJ-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-TraderJ-Friendly05" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "LambdaMall-ShopPromoter-TraderJ-Friendly01" },
            plans = {
                {
                    proximity_range = nil,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-TraderJ-Friendly02" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-TraderJ-Friendly03" },
                            { weight = 1, value = "LambdaMall-ShopPromoter-TraderJ-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "LambdaMall-ShopPromoter-TraderJ-Friendly05" },
                        },
                    },
                },
            },
        },
    },
    ["CPWhitePawnInstancePromoter-TEMP"] = {
        name    = ReactionSchemeName.CPWhitePawnInstancePromoter_TEMP,
        inherit = "NPC_Enthusiastic",
        friendly = {
            default_messages = { "8Squared-TEMP-CPWhitePawnInstancePromoter" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-TEMP-CPWhitePawnInstancePromoter" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-TEMP-CPWhitePawnInstancePromoter" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-TEMP-CPWhitePawnInstancePromoter" },
                        },
                    },
                },
            },
        },
    },
    ["CPRedPawnInstancePromoter-TEMP"] = {
        name    = ReactionSchemeName.CPRedPawnInstancePromoter_TEMP,
        inherit = "NPC_Enthusiastic",
        friendly = {
            default_messages = { "8Squared-TEMP-CPRedPawnInstancePromoter" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-TEMP-CPRedPawnInstancePromoter" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-TEMP-CPRedPawnInstancePromoter" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-TEMP-CPRedPawnInstancePromoter" },
                        },
                    },
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-WoodIsland-Logger"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_WoodIsland_Logger,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-WoodIsland-MaleVillager"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_WoodIsland_MaleVillager,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-WoodIsland-FemaleVillager"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_WoodIsland_FemaleVillager,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-WoodIsland-Merchant"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_WoodIsland_Merchant,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-WoodIsland-StaticGuard"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_WoodIsland_StaticGuard,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-WoodIsland-PatrolGuard"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_WoodIsland_PatrolGuard,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-WaterIsland-Fisherman"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_WaterIsland_Fisherman,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-WaterIsland-MaleVillager"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_WaterIsland_MaleVillager,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-WaterIsland-FemaleVillager"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_WaterIsland_FemaleVillager,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-WaterIsland-Merchant"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_WaterIsland_Merchant,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-WaterIsland-StaticGuard"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_WaterIsland_StaticGuard,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-WaterIsland-PatrolGuard"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_WaterIsland_PatrolGuard,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-MetalIsland-MetalForger"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_MetalIsland_MetalForger,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-MetalIsland-MaleVillager"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_MetalIsland_MaleVillager,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-MetalIsland-FemaleVillager"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_MetalIsland_FemaleVillager,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-MetalIsland-Merchant"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_MetalIsland_Merchant,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-MetalIsland-StaticGuard"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_MetalIsland_StaticGuard,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-MetalIsland-PatrolGuard"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_MetalIsland_PatrolGuard,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-FireIsland-Emblazer"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_FireIsland_Emblazer,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-FireIsland-MaleVillager"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_FireIsland_MaleVillager,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-FireIsland-FemaleVillager"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_FireIsland_FemaleVillager,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-FireIsland-Merchant"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_FireIsland_Merchant,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-FireIsland-StaticGuard"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_FireIsland_StaticGuard,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-FireIsland-PatrolGuard"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_FireIsland_PatrolGuard,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                },
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Male-Optimistic"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Male_Optimistic,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male01-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male01-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male01-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male01-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male01-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male01-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Male-Wise"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Male_Wise,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male02-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male02-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male02-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male02-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male02-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male02-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Male-IronJustice"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Male_IronJustice,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male03-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male03-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male03-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male03-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male03-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male03-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Male-Hopeless"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Male_Hopeless,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male04-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male04-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male04-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male04-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male04-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male04-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Male-Hopeful"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Male_Hopeful,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male05-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male05-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male05-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male05-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male05-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male05-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Male-Jolly"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Male_Jolly,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male06-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male06-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male06-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male06-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male06-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male06-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Male-Wise2"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Male_Wise2,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male07-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male07-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male07-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male07-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male07-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male07-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Male-Ungrateful"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Male_Ungrateful,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male08-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male08-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male08-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male08-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male08-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male08-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Male-Happy"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Male_Happy,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male09-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male09-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male09-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male09-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male09-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male09-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Female-Optimistic"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Female_Optimistic,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = nil,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female01-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female01-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female01-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female01-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female01-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female01-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Female-Wise"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Female_Wise,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female02-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female02-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female02-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female02-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female02-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female02-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Female-Philosophic"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Female_Philosophic,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female03-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female03-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female03-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female03-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female03-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female03-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Female-Troubled"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Female_Troubled,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female04-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female04-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female04-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female04-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female04-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female04-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Female-Forgetful"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Female_Forgetful,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female05-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female05-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female05-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female05-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female05-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female05-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Female-Paranoid"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Female_Paranoid,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female06-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female06-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female06-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female06-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female06-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female06-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Female-Materialistic"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Female_Materialistic,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female07-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female07-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female07-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female07-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female07-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female07-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Female-Curious"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Female_Curious,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female08-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female08-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female08-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female08-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female08-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female08-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Female-Cynical"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Female_Cynical,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female09-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female09-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female09-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female09-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female09-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female09-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Female-Inlove"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Female_Inlove,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female10-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female10-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female10-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female10-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female10-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female10-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Female-Jolly"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Female_Jolly,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female11-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female11-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female11-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female11-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female11-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female11-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Female-IronJustice"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Female_IronJustice,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female12-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female12-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female12-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female12-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female12-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female12-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Female-Worrywart"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Female_Worrywart,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female13-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female13-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female13-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female13-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female13-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Female13-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Male-Inlove"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Male_Inlove,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male10-001" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male10-002" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male10-003" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male10-004" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male10-005" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Male10-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-CombatAiBiped-Monkeyman01"] = {
        name    = ReactionSchemeName._5Isle_CombatAiBiped_Monkeyman01,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan01-001" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan01-002" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan01-003" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan01-004" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan01-005" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan01-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "5Isle-CombatAiBiped-MonkeyMan01-001", "5Isle-CombatAiBiped-MonkeyMan01-002", "5Isle-CombatAiBiped-MonkeyMan01-003", "5Isle-CombatAiBiped-MonkeyMan01-004", "5Isle-CombatAiBiped-MonkeyMan01-005", "5Isle-CombatAiBiped-MonkeyMan01-006" },
            plans = {
            },
        },
    },
    ["5Isle-CombatAiBiped-Monkeyman02"] = {
        name    = ReactionSchemeName._5Isle_CombatAiBiped_Monkeyman02,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan02-001" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan02-002" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan02-003" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan02-004" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan02-005" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan02-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-CombatAiBiped-Monkeyman03"] = {
        name    = ReactionSchemeName._5Isle_CombatAiBiped_Monkeyman03,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan03-001" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan03-002" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan03-003" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan03-004" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan03-005" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan03-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-CombatAiBiped-Monkeyman04"] = {
        name    = ReactionSchemeName._5Isle_CombatAiBiped_Monkeyman04,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan04-001" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan04-002" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan04-003" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan04-004" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan04-005" },
                            { weight = 1, value = "5Isle-CombatAiBiped-MonkeyMan04-006" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Greeting1"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Greeting1,
        inherit = "5Isle-NonCombatAiBiped-ThePeople-Female-Jolly",
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    wait_duration = 5,
                    output_actions = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "Bow" },
                        },
                    },
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Greetings1" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Greetings2" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["5Isle-NonCombatAiBiped-ThePeople-Greeting2"] = {
        name    = ReactionSchemeName._5Isle_NonCombatAiBiped_ThePeople_Greeting2,
        inherit = "5Isle-NonCombatAiBiped-ThePeople-Male-Happy",
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 3,
                    wait_duration = 2,
                    output_actions = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "Greeting" },
                        },
                    },
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Greetings3" },
                            { weight = 1, value = "5Isle-NonCombatAiBiped-ThePeople-Greetings2" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["NewbieGuard"] = {
        name    = ReactionSchemeName.NewbieGuard,
        inherit = nil,
        friendly = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                    output_groups = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "Guard" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
                {
                    proximity_range = 10,
                    output_groups = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "Guard" },
                        },
                    },
                },
            },
        },
    },
    ["Newbie-5Isle-Female-Balcony-Greeting01"] = {
        name    = ReactionSchemeName.Newbie_5Isle_Female_Balcony_Greeting01,
        inherit = nil,
        friendly = {
            default_messages = { "Newbie-5Isle-Balcony-Female-Friendly01" },
            plans = {
                {
                    proximity_range = 20,
                    wait_duration = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "Newbie-5Isle-Balcony-Female-Friendly05" },
                            { weight = 1, value = "Newbie-5Isle-Balcony-Female-Friendly06" },
                            { weight = 1, value = "Newbie-5Isle-Balcony-Female-Friendly01" },
                            { weight = 1, value = "Newbie-5Isle-Balcony-Female-Friendly02" },
                            { weight = 1, value = "Newbie-5Isle-Balcony-Female-Friendly03" },
                            { weight = 1, value = "Newbie-5Isle-Balcony-Female-Friendly04" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["Newbie-5Isle-Male-Balcony-Greeting01"] = {
        name    = ReactionSchemeName.Newbie_5Isle_Male_Balcony_Greeting01,
        inherit = nil,
        friendly = {
            default_messages = { "Newbie-5Isle-Balcony-Male-Friendly01" },
            plans = {
                {
                    proximity_range = 20,
                    wait_duration = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "Newbie-5Isle-Balcony-Male-Friendly01" },
                            { weight = 1, value = "Newbie-5Isle-Balcony-Male-Friendly02" },
                            { weight = 1, value = "Newbie-5Isle-Balcony-Male-Friendly03" },
                            { weight = 1, value = "Newbie-5Isle-Balcony-Male-Friendly04" },
                            { weight = 1, value = "Newbie-5Isle-Balcony-Male-Friendly05" },
                            { weight = 1, value = "Newbie-5Isle-Balcony-Male-Friendly06" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["Newbie-5Isle-Child-Balcony-Greeting01"] = {
        name    = ReactionSchemeName.Newbie_5Isle_Child_Balcony_Greeting01,
        inherit = nil,
        friendly = {
            default_messages = { "Newbie-5Isle-Balcony-Child-Friendly01" },
            plans = {
                {
                    proximity_range = 20,
                    wait_duration = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "Newbie-5Isle-Balcony-Child-Friendly01" },
                            { weight = 1, value = "Newbie-5Isle-Balcony-Child-Friendly02" },
                            { weight = 1, value = "Newbie-5Isle-Balcony-Child-Friendly03" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = {},
            plans = {
            },
        },
    },
    ["8Squared-TwinFort-ScoutingForAnswers-RedArmy"] = {
        name    = ReactionSchemeName._8Squared_TwinFort_ScoutingForAnswers_RedArmy,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-TwinFort-ScoutingForAnswers-RedArmy-01" },
            plans = {
                {
                    proximity_range = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-TwinFort-ScoutingForAnswers-RedArmy-02" },
                            { weight = 1, value = "8Squared-TwinFort-ScoutingForAnswers-RedArmy-03" },
                            { weight = 1, value = "8Squared-TwinFort-ScoutingForAnswers-RedArmy-04" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-TwinFort-ScoutingForAnswers-RedArmy-05", "8Squared-TwinFort-ScoutingForAnswers-RedArmy-06" },
            plans = {
                {
                    proximity_range = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-TwinFort-ScoutingForAnswers-RedArmy-05" },
                        },
                    },
                },
                {
                    wait_duration = 6,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-TwinFort-ScoutingForAnswers-RedArmy-06" },
                        },
                    },
                },
            },
        },
    },
    ["8Squared-TwinFort-ScoutingForAnswers-MedicWeasley"] = {
        name    = ReactionSchemeName._8Squared_TwinFort_ScoutingForAnswers_MedicWeasley,
        inherit = nil,
        friendly = {
            default_messages = { "8Squared-TwinFort-ScoutingForAnswers-MedicWeasley-01" },
            plans = {
                {
                    proximity_range = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-TwinFort-ScoutingForAnswers-MedicWeasley-02" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Squared-TwinFort-ScoutingForAnswers-MedicWeasley-01" },
            plans = {
                {
                    proximity_range = 10,
                    wait_duration = 6,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Squared-TwinFort-ScoutingForAnswers-MedicWeasley-02" },
                        },
                    },
                },
            },
        },
    },
    ["Zombie01"] = {
        name    = ReactionSchemeName.Zombie01,
        inherit = nil,
        friendly = {
            default_messages = { "8Sq-Zombie03", "8Sq-Zombie02" },
            plans = {
                {
                    proximity_range = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Sq-Zombie02" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "8Sq-Zombie01" },
            plans = {
                {
                    proximity_range = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "8Sq-Zombie02" },
                        },
                    },
                },
            },
        },
    },
    ["ShopPromoterLotsOfSlots"] = {
        name    = ReactionSchemeName.ShopPromoterLotsOfSlots,
        inherit = "ShopPromoterAttractBase",
        friendly = {
            default_messages = { "ShopPromoter-LotsOfSlots-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "ShopPromoter-LotsOfSlots-Friendly01" },
                            { weight = 1, value = "ShopPromoter-LotsOfSlots-Friendly02" },
                            { weight = 1, value = "ShopPromoter-LotsOfSlots-Friendly03" },
                            { weight = 1, value = "ShopPromoter-LotsOfSlots-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "ShopPromoter-LotsOfSlots-Friendly01" },
                            { weight = 1, value = "ShopPromoter-LotsOfSlots-Friendly02" },
                            { weight = 1, value = "ShopPromoter-LotsOfSlots-Friendly04" },
                        },
                    },
                },
            },
        },
        neutral = {
            default_messages = { "ShopPromoter-LotsOfSlots-Friendly01" },
            plans = {
                {
                    proximity_range = 3,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "ShopPromoter-LotsOfSlots-Friendly01" },
                            { weight = 1, value = "ShopPromoter-LotsOfSlots-Friendly02" },
                            { weight = 1, value = "ShopPromoter-LotsOfSlots-Friendly03" },
                            { weight = 1, value = "ShopPromoter-LotsOfSlots-Friendly04" },
                        },
                    },
                },
                {
                    wait_duration = 10,
                    output_messages = {
                        chance = 1,
                        items  = {
                            { weight = 1, value = "ShopPromoter-LotsOfSlots-Friendly01" },
                            { weight = 1, value = "ShopPromoter-LotsOfSlots-Friendly02" },
                            { weight = 1, value = "ShopPromoter-LotsOfSlots-Friendly03" },
                            { weight = 1, value = "ShopPromoter-LotsOfSlots-Friendly04" },
                        },
                    },
                },
            },
        },
    },
}

return {
    ReactionType       = ReactionType,
    EmoteGroupName     = EmoteGroupName,

    ActionName         = ActionName,
    AnimName           = AnimName,
    IconName           = IconName,
    ReactionSchemeName = ReactionSchemeName,

    Actions            = Actions,
    EmoteGroups        = EmoteGroups,
    ReactionSchemes    = ReactionSchemes,
}

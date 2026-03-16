-- ==============================================================
-- Schema.behaviorConfig.settings
-- ==============================================================

--- One key/value pair in a behavior's settings list.
--- Corresponds to a single item of Schema.behaviorConfig.settings.value[].
---@class BehaviorSetting
---@field settingName  string  Name of the setting
---@field settingValue string  Value of the setting (always a string in the schema)


-- ==============================================================
-- Schema.behaviorConfig.configurations  —  nested types
-- ==============================================================

--- Identifies a behavior to run when the parent configuration is entered.
--- Corresponds to BehaviorConfigEntry.behaviorOnEnter.
---@class BehaviorOnEnter
---@field behaviorName string  Name of the behavior to activate on entry
---@field behaviorInit string  Initialization string passed to the behavior


--- One entry inside BehaviorConfigEntry.allowedChildren[].
--- Describes a child behavior that may be spawned, with its own
--- settings, weighting, repeat policy, and duration range.
---@class AllowedChild
---@field behaviorName string           Behavior type identifier (behaviorDetailed)
---@field settings     BehaviorSetting[] Behavior-specific settings (extends Schema.behaviorConfig.settings)
---@field weight       number?          Relative selection weight for this child
---@field canRepeat    boolean?         Whether this child may be selected more than once per cycle
---@field duration     number[]?        [min, max] duration range in seconds (minItems: 2)


--- One entry inside BehaviorConfigEntry.scheduledAbilities[].
--- Describes a timed ability that fires on a configurable schedule.
---@class ScheduledAbility
---@field abilityName        string   Name of the ability to schedule
---@field isEnabled          boolean? Whether this scheduled ability is currently active
---@field firstTimeDelayMin  number?  Minimum delay in seconds before the ability fires for the first time
---@field firstTimeDelayMax  number?  Maximum delay in seconds before the ability fires for the first time
---@field loopTimes          integer? Number of times to repeat after the first firing (0 = fire once)
---@field loopIntervalMin    number?  Minimum interval in seconds between repeated firings
---@field loopIntervalMax    number?  Maximum interval in seconds between repeated firings


--- One element of Schema.behaviorConfig.configurations.value[].
--- Describes a complete behavior configuration: its type, settings,
--- entry behavior, permitted children, and scheduled abilities.
---@class BehaviorConfigEntry
---@field behaviorName       string              Behavior type identifier (behaviorDetailed)
---@field settings           BehaviorSetting[]   Behavior-specific settings (extends Schema.behaviorConfig.settings)
---@field behaviorOnEnter    BehaviorOnEnter?    Optional behavior to run when this configuration is entered
---@field allowedChildren    AllowedChild[]?     Child behaviors that may be spawned under this configuration
---@field scheduledAbilities ScheduledAbility[]? Abilities scheduled to fire on a timed basis

---@class BehaviorConfig
---@field configurations BehaviorConfigEntry[]? List of behavior configurations, keyed by their behaviorName
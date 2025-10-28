Config = {}
Config.Debug = false

-- ============================================================================================
-- Basic settings
-- ============================================================================================
Config.MinSpeed = 18.0 -- Minimum speed for shake activation (mph)
Config.MaxSpeed = 75.0 -- Maximum speed for full shake intensity (mph)

-- ============================================================================================
-- Camera Shake settings
-- ============================================================================================
Config.ShakeType = "SMALL_EXPLOSION_SHAKE" -- Shake effect type
Config.MinDuration = 500 -- Minimum shake length (ms)
Config.MaxDuration = 2000 -- Maximum shake length (ms)
Config.MinAmplitude = 0.5 -- Minimum shake force
Config.MaxAmplitude = 2.0 -- Maximum shake force
Config = {}
Config.Debug = true

-- ============================================================================
-- DEFAULT SETTINGS
-- ============================================================================
Config.DefaultDifficulty = 'normal'

-- ============================================================================
-- MINIGAME DIFFICULTY SETTING
-- ============================================================================
Config.WiringDifficulty = {
    ['normal'] = {
        wires = {'A', 'B', 'C', 'D', 'E', 'F'},
        timeLimit = 8,
        description = 'Medium difficulty'
    }
}

-- ============================================================================
-- WIRE COLORS
-- ============================================================================
Config.WireColors = {
    ['A'] = '#ff4757',
    ['B'] = '#2ed573',
    ['C'] = '#1e90ff',
    ['D'] = '#ffa502',
    ['E'] = '#a55eea',
    ['F'] = '#ffdd59',
    ['G'] = '#1bc4c4ff',
    ['H'] = '#a0cf1dff',
    ['CH'] = '#dd1c7dff'
}

-- ============================================================================
-- GAME SETTINGS
-- ============================================================================
Config.GameSettings = {
    shuffleRightSide = true,
    enableSounds = true,
    showProgress = true,
    allowRetry = true,
    disableMovement = true,
    enableNuiFocus = true,

    sounds = {
        success = {soundName = 'SELECT', soundSet = 'HUD_FRONTEND_DEFAULT_SOUNDSET'},
        failure = {soundName = 'QUIT', soundSet = 'HUD_FRONTEND_DEFAULT_SOUNDSET'},
        correctConnection = {soundName = 'SELECT', soundSet = 'HUD_FRONTEND_DEFAULT_SOUNDSET'},
        wrongConnection = {soundName = 'ERROR', soundSet = 'HUD_FRONTEND_DEFAULT_SOUNDSET'},
        timerBeep = {soundName = '10_SEC_WARNING', soundSet = 'HUD_MINI_GAME_SOUNDSET'}
    }
}

-- ============================================================================
-- EXPORT FUNCTIONS FOR OTHER SCRIPTS
-- ============================================================================
Config.Exports = {
    startWiringMinigame = true,
    isMinigameActive = true,
    forceCloseMinigame = true,
    getConfig = true
}
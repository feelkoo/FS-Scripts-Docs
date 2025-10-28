Config = {}

-- Leave empty for auto-detection or set manually: 'ox_inventory', 'qb', 'ps', 'custom'
Config.Inventory = '' -- Auto-detect if empty

-- ============================================================================
-- PROGRESS BAR SETTINGS
-- ============================================================================
Config.ProgressBar = {
    duration = 500,                 -- Duration in milliseconds (used for all inventories)
    label = 'Reading paper...',     -- Progress bar label (QBCore only, ox_inventory doesn't show label)
}

-- ============================================================================================
-- 🗂️ PAPER CONFIGURATION 🗂️
-- ============================================================================================
-- // Config item //
-- ['item_name'] = {
--     title = 'Title of paper',
--     description = 'description of paper'
-- },
--
-- // Next, always add this item to items.lua in ox_inventory //
-- 	['fs_paper_example'] = {
--		label = 'Text label (ox_inventory)',
--		weight = 10,
--		stack = false,
--		close = true,
--		consume = 0,
--		client = {
--			image = 'fs_paper.png',
--			export = 'fs_papers.usePaper',
--			usetime = 500,  -- IMPORTANT: Must match Config.ProgressBar.duration for progress bar to work
--			-- NOTE: Do NOT define anim/prop here!
--			-- Animation and prop are handled by fs_papers client.lua with correct bone and positions
--			disable = { move = false, car = false, combat = true }
--		}
--	}	
-- ============================================================================

Config.Papers = {
    ['fs_paper_example'] = {
        title = 'Custom title by config',
        description = [[
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. 

            ⚠️ Lorem ipsum dolor:
            • Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            • Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            • Lorem ipsum dolor sit amet, consectetur adipiscing elit.

            📦 Lorem ipsum dolor:
            • Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            • Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            • Lorem ipsum dolor sit amet, consectetur adipiscing elit.

            🚨 Lorem ipsum dolor:
            • Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            • Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            • Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        ]]
    }, 
}

-- ============================================================================
-- ESC KEY SETTINGS
-- ============================================================================
Config.Controls = {
    closeKey = 'ESCAPE'
}
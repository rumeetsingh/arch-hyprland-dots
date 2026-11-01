------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "DP-1",
	mode = "2560x1440@180",
	position = "auto",
	scale = "1",
	-- bitdepth = 10,
	-- cm = "hdr",
	-- supports_hdr = 1,
})

-----------------
---- RENDER -----
-----------------

hl.config({
	render = {
		cm_auto_hdr = 0,
	},
})

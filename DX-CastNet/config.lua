Config = {}
Config.lang = 'th'
Config.EnableSkillCheck = true -- ปิดเปิด มินิเกม
Config.Itemuse = 'fishing_net' -- ไอเทมกดใช้
Config.PercentGive = 50 -- เปอร์เซ็นที่จะได้รับของ Droprate
Config.PercentRemove = 50 -- เปอร์เซ็น แห พัง

Config.MiniGame = { -- easy = ช้า // medium = เร็ว // hard = เร็วมากกก
    Mini_one = 'easy',
    Mini_two = 'medium',
    Mini_Three = 'hard',
    MimiSkillCheck = {'w', 'a', 's', 'd'}, -- RanDom Key
}

Config.Zonefish = {
    -- Zone
    range = 50.0, -- ความกว้างของโซน
    location = {x = 2169.87, y =  3850.86, z = 30.38}, -- จุดตรงกลางโซน

    -- Blips
    EnableBlips		= true, -- เปิดปิด Blips
    Blips_id		= 1, -- รูปของ Blips
	Blips_Scale		= 0.6, -- ขนาดของ Blips
	Blips_Colour	= 2, -- สีของ Blips
    Blips_Alpha     = 150, -- Alphaของ Blips
	Blips_Name		= 'Zone Fishing', -- ชื่อของ Blips

    -- Marker
    EnableMarker = true, -- เปิดปิด Marker
    Marker_R    = 40, -- สีของ Marker
    Marker_G    = 98, -- สีของ Marker
    Marker_B    = 129, -- สีของ Marker
}



Config.Droprate = { -- [ ไอเทมโบนัส เพิิ่มใน sql ]
    {
        ItemName = "yang",    -- ไอเทมโบนัส
        ItemCount = {1, 2},    -- จำนวน
        Percent = 30          -- %
	},
    {
        ItemName = "rubbish",    -- ไอเทมโบนัส
        ItemCount = {1, 2},    -- จำนวน
        Percent = 40          -- %
	},
    {
        ItemName = "catfish",    -- ไอเทมโบนัส
        ItemCount = {1, 5},    -- จำนวน
        Percent = 50          -- %
	},
}

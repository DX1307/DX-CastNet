DXHIGH = {}
DXHIGH.lang = 'th'
DXHIGH.EnableSkillCheck = true -- ปิดเปิด มินิเกม
DXHIGH.Itemuse = 'fishing_net' -- ไอเทมกดใช้
DXHIGH.PercentGive = 50 -- เปอร์เซ็นที่จะได้รับของ Droprate
DXHIGH.PercentRemove = 50 -- เปอร์เซ็น แห พัง


DXHIGH.Droprate = { -- [ ไอเทมโบนัส เพิิ่มใน sql ]
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
        ItemCount = {1, 2},    -- จำนวน
        Percent = 50          -- %
	},
}
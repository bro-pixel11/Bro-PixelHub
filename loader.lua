repeat task.wait() until game:IsLoaded()

print([[
██████╗ ██████╗  ██████╗
██╔══██╗██╔══██╗██╔═══██╗
██████╔╝██████╔╝██║   ██║
██╔══██╗██╔══██╗██║   ██║
██████╔╝██║  ██║╚██████╔╝
╚═════╝ ╚═╝  ╚═╝ ╚═════╝

        PIXEL HUB
]])

task.wait(1)

loadstring(game:HttpGet("https://raw.githubusercontent.com/bro-pixel11/Bro-PixelHub/main/wordbomb.lua"))()

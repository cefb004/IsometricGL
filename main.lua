-- main.lua

local SCALE = 5
local SPEED = 200 -- pixels por segundo

-- Sprites
local idleImage
local attackImage

-- Attack animation
local attackFrames = {}
local currentFrame = 1
local frameTimer = 0
local frameDuration = 0.1
local isAttacking = false

-- Personagem
local x, y
local direction = "down" -- atualmente apenas para referência futura

function love.load()
    x = 100
    y = 100

    -- Carrega imagens
    idleImage = love.graphics.newImage("assets/sprites/barbarian_idle.png")
    attackImage = love.graphics.newImage("assets/sprites/barbarian_attack.png")

    -- Cria quads para ataque
    local attackWidth = attackImage:getWidth() / 4
    local attackHeight = attackImage:getHeight()
    for i = 0, 3 do
        attackFrames[i + 1] = love.graphics.newQuad(
            i * attackWidth, 0, attackWidth, attackHeight,
            attackImage:getDimensions()
        )
    end
end

function love.update(dt)
    local moveX, moveY = 0, 0

    -- Movimento com setas
    if love.keyboard.isDown("up") then
        moveY = moveY - 1
        direction = "up"
    elseif love.keyboard.isDown("down") then
        moveY = moveY + 1
        direction = "down"
    end
    if love.keyboard.isDown("left") then
        moveX = moveX - 1
        direction = "left"
    elseif love.keyboard.isDown("right") then
        moveX = moveX + 1
        direction = "right"
    end

    -- Normaliza diagonal
    if moveX ~= 0 and moveY ~= 0 then
        local norm = math.sqrt(moveX^2 + moveY^2)
        moveX = moveX / norm
        moveY = moveY / norm
    end

    -- Atualiza posição
    x = x + moveX * SPEED * dt
    y = y + moveY * SPEED * dt

    -- Atualiza ataque
    if isAttacking then
        frameTimer = frameTimer + dt
        if frameTimer >= frameDuration then
            frameTimer = frameTimer - frameDuration
            currentFrame = currentFrame + 1
            if currentFrame > #attackFrames then
                currentFrame = 1
                isAttacking = false
            end
        end
    end
end

function love.draw()
    if isAttacking then
        local attackQuad = attackFrames[currentFrame]
        love.graphics.draw(attackImage, attackQuad, x, y, 0, SCALE, SCALE)
    else
        love.graphics.draw(idleImage, x, y, 0, SCALE, SCALE)
    end
end

function love.keypressed(key)
    if key == "space" and not isAttacking then
        isAttacking = true
        currentFrame = 1
        frameTimer = 0
    end
end


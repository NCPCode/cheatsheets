function checkCollision(coords1, size1, coords2, size2)
  return coords1[1] < coords2[1] + size2[1] and
          coords2[1] < coords1[1] + size1[1] and
          coords1[2] < coords2[2] + size2[2] and
          coords2[2] < coords1[2] + size1[2]
end

function reset()
  if iteration > highestScore then
    highestScore = iteration
  end

  playerCoords = {DEFAULT_PLAYER_COORDS[1], DEFAULT_PLAYER_COORDS[2]}
  rain = {}
  iteration = 0
end

function love.load()
  PLAYER_SIZE = {10, 10}
  RAIN_SIZE = {15, 15}
  RAIN_FREQUENCY = 50
  RAIN_SPEED = .5
  PLAYER_SPEED = .4
  SCREEN_SIZE = {400, 400}
  DEFAULT_PLAYER_COORDS = {SCREEN_SIZE[1] / 2, SCREEN_SIZE[2] - 50}
  CURRENT_SCORE_COORDS = {10, SCREEN_SIZE[2] - 30}
  HIGH_SCORE_COORDS = {10, SCREEN_SIZE[2] - 20}
  LEFT_KEY = 'a'
  RIGHT_KEY = 'd'

  highestScore = 0
  iteration = 0
  playerCoords = {DEFAULT_PLAYER_COORDS[1], DEFAULT_PLAYER_COORDS[2]}
  rain = {}
end

function love.update()
  if (iteration % RAIN_FREQUENCY == 0) then
    rain[#rain + 1] = {love.math.random(-RAIN_SIZE[1], SCREEN_SIZE[1]), 0}
  end

  for i = #rain, 1, -1 do
    rain[i][2] = rain[i][2] + RAIN_SPEED

    if rain[i][2] > DEFAULT_PLAYER_COORDS[2] + PLAYER_SIZE[2] - RAIN_SIZE[2] then
      table.remove(rain, i)
    elseif checkCollision(
      rain[i], RAIN_SIZE,
      playerCoords, PLAYER_SIZE
    ) then
      reset()
      break
    end
  end

  if love.keyboard.isDown(LEFT_KEY) then
    playerCoords[1] = playerCoords[1] - PLAYER_SPEED
  elseif love.keyboard.isDown(RIGHT_KEY) then
    playerCoords[1] = playerCoords[1] + PLAYER_SPEED
  end

  if playerCoords[1] < 0 then
    playerCoords[1] = 0
  elseif playerCoords[1] + PLAYER_SIZE[1] > SCREEN_SIZE[1] then
    playerCoords[1] = SCREEN_SIZE[1] - PLAYER_SIZE[1]
  end

  iteration = iteration + 1
end

function love.draw()
  love.graphics.rectangle('fill', playerCoords[1], playerCoords[2], PLAYER_SIZE[1], PLAYER_SIZE[2])

  for i, v in pairs(rain) do
    love.graphics.rectangle('fill', v[1], v[2], RAIN_SIZE[1], RAIN_SIZE[2])
  end

  love.graphics.print(iteration, CURRENT_SCORE_COORDS[1], CURRENT_SCORE_COORDS[2])
  love.graphics.print(highestScore, HIGH_SCORE_COORDS[1], HIGH_SCORE_COORDS[2])
end

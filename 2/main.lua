function intersects(coords1, size1, coords2, size2)
  return coords1[1] < coords2[1] + size2[1] and
         coords2[1] < coords1[1] + size1[1] and
         coords1[2] < coords2[2] + size2[2] and
         coords2[2] < coords1[2] + size1[2]
end

function contains(coords1, size1, coords2, size2)
  return coords1[1] >= coords2[1] and
         coords1[1] + size1[1] < coords2[1] + size2[1] and
         coords1[2] >= coords2[2] and
         coords1[2] + size1[2] < coords2[2] + size2[2]
end

function findCenter(size1, size2)
  return size1 / 2 - size2 / 2
end

function reset()
  if iteration > highestScore then
    highestScore = iteration
  end

  playerCoords = {DEFAULT_PLAYER_COORDS[1], DEFAULT_PLAYER_COORDS[2]}
  rain = {}
  iteration = 0
  squareWidth = SCREEN_WIDTH
  squareCoords = {0, 0}
  squareDirection = love.math.random(0, 1) and -1 or 1
  phase = 0
end

function love.load()
  PLAYER_SIZE = {6, 6}
  RAIN_SIZE = {10, 10}
  RAIN_FREQUENCY = 50
  RAIN_SPEED = .5
  PLAYER_SPEED = .3
  SCREEN_WIDTH = 400
  DEFAULT_PLAYER_COORDS = {SCREEN_WIDTH / 2, SCREEN_WIDTH - 50}
  CURRENT_SCORE_COORDS = {10, SCREEN_WIDTH - 30}
  HIGH_SCORE_COORDS = {10, SCREEN_WIDTH - 20}
  SQUARE_SHRINK_RATE = .1
  LEFT_KEY = 'a'
  RIGHT_KEY = 'd'
  UP_KEY = 'w'
  DOWN_KEY = 's'
  PHASE_0_BREAK = 200
  SQUARE_SPEED = .2

  highestScore = 0
  iteration = 0
  reset()
end

function love.update()
  if (iteration % RAIN_FREQUENCY == 0) then
    rain[#rain + 1] = {love.math.random(-RAIN_SIZE[1], 400), 0}
  end

  for i = #rain, 1, -1 do
    rain[i][2] = rain[i][2] + RAIN_SPEED

    if rain[i][2] > DEFAULT_PLAYER_COORDS[2] + PLAYER_SIZE[2] - RAIN_SIZE[2] then
      table.remove(rain, i)
    elseif intersects(
      rain[i], RAIN_SIZE,
      playerCoords, PLAYER_SIZE
    ) then
      reset()
      break
    end
  end

  if (phase == 0) then
    squareWidth = squareWidth - SQUARE_SHRINK_RATE
    local center = SCREEN_WIDTH / 2 - squareWidth / 2
    squareCoords = {center, center}

    if squareWidth <= PHASE_0_BREAK then
      phase = 1
    end

  elseif (phase == 1) then
    squareCoords[1] = squareCoords[1] + SQUARE_SPEED * squareDirection
    if not contains(
      squareCoords, {squareWidth, squareWidth},
      {0, 0}, {SCREEN_WIDTH, SCREEN_WIDTH}
    ) then
      squareDirection = squareDirection * -1
    end
  end

  if not contains(
    playerCoords, PLAYER_SIZE,
    squareCoords, {squareWidth, squareWidth}
  ) then
    reset()
  end


  if love.keyboard.isDown(LEFT_KEY) then
    playerCoords[1] = playerCoords[1] - PLAYER_SPEED
  elseif love.keyboard.isDown(RIGHT_KEY) then
    playerCoords[1] = playerCoords[1] + PLAYER_SPEED
  end

  if love.keyboard.isDown(UP_KEY) then
    playerCoords[2] = playerCoords[2] - PLAYER_SPEED
  elseif love.keyboard.isDown(DOWN_KEY) then
    playerCoords[2] = playerCoords[2] + PLAYER_SPEED
  end

  if playerCoords[1] < 0 then
    playerCoords[1] = 0
  elseif playerCoords[1] + PLAYER_SIZE[1] > SCREEN_WIDTH then
    playerCoords[1] = SCREEN_WIDTH - PLAYER_SIZE[1]
  end

  iteration = iteration + 1
end

function love.draw()
  love.graphics.rectangle('fill', playerCoords[1], playerCoords[2], PLAYER_SIZE[1], PLAYER_SIZE[2])

  for i, v in pairs(rain) do
    love.graphics.rectangle('fill', v[1], v[2], RAIN_SIZE[1], RAIN_SIZE[2])
  end

  love.graphics.rectangle('line', squareCoords[1], squareCoords[2], squareWidth, squareWidth)

  love.graphics.print(iteration, CURRENT_SCORE_COORDS[1], CURRENT_SCORE_COORDS[2])
  love.graphics.print(highestScore, HIGH_SCORE_COORDS[1], HIGH_SCORE_COORDS[2])
end

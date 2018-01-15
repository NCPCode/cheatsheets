function checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)
  return x1 < x2 + w2 and
         x2 < x1 + w1 and
         y1 < y2 + h2 and
         y2 < y1 + h1
end

function reset()
  if iteration and iteration > highestScore then
    highestScore = iteration
  end

  playerCoordinates = { x = 200, y = 350 }
  rain = {}
  iteration = 0
end


function love.load()
  PLAYER_SIZE = 10
  RAIN_SIZE = 20
  RAIN_FREQUENCY = 100

  highestScore = 0
  reset()
end

function love.update()
  if (iteration % RAIN_FREQUENCY == 0) then
    rain[#rain + 1] = { x = love.math.random(-RAIN_SIZE, 400), y = 0 }
  end

  -- for i = 1, #rain do
  --   v[i]['y'] = v[i]['y'] + 1

  --   if v[i]['y'] > 400 then
  --     v[i] = nil
  --   end
  -- end

  for i, v in pairs(rain) do
    v['y'] = v['y'] + 1

    if v['y'] > 400 then
      table.remove(rain, i)
    end

    if checkCollision(
      v['x'], v['y'], RAIN_SIZE, RAIN_SIZE,
      playerCoordinates['x'], playerCoordinates['y'], PLAYER_SIZE, PLAYER_SIZE
    ) then
      reset()
    end
  end

  if love.keyboard.isDown('a') and playerCoordinates['x'] >= 0 then
    playerCoordinates['x'] = playerCoordinates['x'] - 1
  elseif love.keyboard.isDown('d') and playerCoordinates['x'] < 390 then
    playerCoordinates['x'] = playerCoordinates['x'] + 1
  end

  iteration = iteration + 1
end

function love.draw()
  love.graphics.rectangle('fill', playerCoordinates['x'], playerCoordinates['y'], PLAYER_SIZE, PLAYER_SIZE)

  for i, v in pairs(rain) do
    love.graphics.rectangle('fill', v['x'], v['y'], RAIN_SIZE, RAIN_SIZE)
  end

  love.graphics.print(iteration, 0, 0)
  love.graphics.print(highestScore, 0, 375)
end

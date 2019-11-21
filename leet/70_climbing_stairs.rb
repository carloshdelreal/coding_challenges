# frozen_string_literal: true

def climb_stairs(n_stairs)
  record = {}
  record[2] = 2
  record[1] = 1

  stair = 3

  while stair <= n_stairs
    record[stair] = record[stair - 1] + record[stair - 2]
    stair += 1
  end

  record[n_stair]
end

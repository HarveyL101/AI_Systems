
function one_max_ga()
    % Parameters
    population_size = 100;
    string_length = 50;
    generations = 100;
    mutation_rate = 0.01;

    % Initialise population
    population = randi([0, 1], population_size, string_length);

    % Main Loop
    for generation = 1:generations
        % Evaluate fitness
        fitness = sum(population, 2); % Sum of ones in each individual

        % Selection (tournament selection)
        selected_parents = tournament_selection(population, fitness, population_size);

        % Crossover
        offspring = crossover(selected_parents);

        % Mutation
        mutated_offspring = mutate(offspring, mutation_rate);

        % Create new population
        population = mutated_offspring;

        % Display best fitness of the generation
        best_fitness = max(fitness);
        fprintf('Generation %d: Best Fitness = %d\n', generation, best_fitness);
    end

    % Final best solution
    final_fitness = sum(population, 2);
    [best_fitness, best_index] = max(final_fitness);
    best_solution = population(best_index, :);

    fprintf('Best solution: %s with fitness %d\n', num2str(best_solution), best_fitness);
end

function selected_parents = tournament_selection(population, fitness, n)
    selected_parents = zeros(n, size(population, 2));
    for i = 1:n
        idx = randi([1, size(population, 1)], 2, 1); % Randomly select two individuals
        if fitness(idx(1)) > fitness(idx(2))
            selected_parents(i, :) = population(idx(1), :);
        else 
            selected_parents(i, :) = population(idx(2), :);
        end
    end
end

function offspring = crossover(parents)
    [num_parents, string_length] = size(parents);
    offspring = zeros(num_parents, string_length);
    for i = 1:2:num_parents-1 % pick every 2, use -1 so you can select the next one i.e. i+1 without running out of the index bounds.
        crossover_point = randi([1, string_length-1]);
        offspring(i, :) = [parents(i, 1:crossover_point), parents(i+1, crossover_point+1:end)];
        offspring(i+1, :) = [parents(i+1, 1:crossover_point), parents(i, crossover_point+1:end)];
    end
    if mod(num_parents, 2) == 1
        offspring(end, :) = parents(end, :); % Carry over last parent if odd
    end
end

function mutated_offspring = mutate(offspring, mutation_rate)
    mutated_offspring = offspring;
    for i = 1:size(offspring, 1)
        for j = 1:size(offspring, 2)
            if rand < mutation_rate
                mutated_offspring(i, j) = ~mutated_offspring(i, j); % Flip bit
            end
        end
    end
end

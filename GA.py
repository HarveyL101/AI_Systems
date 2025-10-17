import random as rand
#import numpy as np
import math

pop = []
population_size = 8
chromosome_length = 10
current_gen = 1
generations = 5


def main():
    pop = init_pop(population_size, chromosome_length)

    print("Initial population: ")
    print_f(pop)
    print("______________________________")

    pop_f = []
    for idx in pop:
        pop_f.append(fitness_f(idx))

    parents = Roulette_wheel(pop, pop_f)
    print("Parents: ")
    print_f(parents)
    print("______________________________")

    offspring = []
    for i in range(0, len(parents), 2):
        parent_a = parents[i]
        parent_b = parents[i+1]

        offspring.append(mating_crossover(parent_a, parent_b))

    

    message = f"Generation {current_gen} population is: "
    print(message)
    print_f(pop)
    print("______________________________")

    current_gen += 1

    return

# Generates initial population
def init_pop(size, chromosome):
    pop = []
    for idx in range(size):
        pop.append(rand.choices(range(2), k = chromosome))

    return pop

# Defines part of the overall fitness, returning number of 1's in a chromosome
def fitness_f(individual):
    return sum(individual)

# List printer function for readability
def print_f(population_f):
    for idx in population_f:
        print(idx)

# Roulette wheel function for random selection
def Roulette_wheel(pop, fitness):
    parents = []

    # Sum all fitness values in the population
    total_f = sum(fitness)

    # Normalise the fitness values range by calculating {Fitness / total_f}
    normalised = [x/total_f for x in fitness]

    print('normalised fitness')
    print('__________________')
    print_f(normalised)
    print('__________________')

    cumulative_f = []
    index = 0

    # Creates a new list of cumulative fitness values for use 
    for value_n in normalised:
        index += value_n
        cumulative_f.append(index)
    
    pop_size = len(pop)

    print('cumulative fitness') 
    print('__________________') 
    print_f(cumulative_f) 
    print('__________________')

    # Appends chromosomes that beat the fitness threshold to a list of successful parents, higher fitness individuals are more likely to appear repeatedly
    for index2 in range(pop_size):
        rand_n = rand.uniform(0, 1)
        individual_n = 0

        for fitvalue in cumulative_f:
            if(rand_n <= fitvalue):
                parents.append(pop[individual_n])
                break
            individual_n += 1
    return parents

# Function to handle crossovers of chromosomes
def mating_crossover(parent_a, parent_b):
    offspring = []
    # decides a random cut point in the chromosome, anywhere between the second and last index of parent_a
    cut_point = rand.randint(1, len(parent_a) -1)

    child1 = parent_a[:cut_point] + parent_b[cut_point:]
    child2 = parent_b[:cut_point] + parent_a[cut_point:]

    mutate(child1)
    mutate(child2)

    # adds beginning of A and end of B together and vice versa, using {cut_point} as the divider
    offspring.append(parent_a[:cut_point] + parent_b[cut_point:])
    offspring.append(parent_b[:cut_point] + parent_a[cut_point:])

    pop.extend(offspring)

    return offspring

# Function to handle mutations
def mutate(chromo):
    for idx in range(len(chromo)):
        if rand.random() < 0.3:
            chromo = chromo[:idx] + [1-chromo[idx]] + chromo[idx + 1:]
    return chromo

main()
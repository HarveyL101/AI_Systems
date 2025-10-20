import random as rand

# Global variables please do not touch
pop = [] # Only alter if you have a specific population variety you want to test
pop_f = []
cumulative_f = []
current_gen = 0
mutations_t = 0

# Variable characteristics of the GA
# !!! WARNING !!! >10 generations greatly slows down the programme, use at your own risk
population_size = 8
chromosome_length = 10
generations = 12

def main():
  global pop
  pop = init_pop(population_size, chromosome_length)

  print("Initial population: ")
  print_f(pop)
  print("______________________________")

  for i in range(generations):
    global current_gen
    global pop_f
    global mutations_t

    # Recalculate fitnesses for the current population — reset list so its length matches `pop`
    pop_f = []
    for idx in pop:
      pop_f.append(fitness_f(idx))

    print_summary(pop, pop_f, current_gen, mutations_t)
    print("***")

    parents = Roulette_wheel(pop, pop_f)
    
    # print("Parents: ")
    # print_f(parents)
    # print("______________________________")

    offspring = []

    for i in range(0, len(parents), 2):
      parent_a = parents[i]
      parent_b = parents[i+1]

      offspring.append(mating_crossover(parent_a, parent_b))

    for pair in offspring:
      pop.extend(pair)

    # print_summary(pop, pop_f, current_gen, mutations)
    # print("***")

    current_gen += 1
  return

def print_summary(pop, pop_f, current_gen, mutations=None):
  gen = f"Generation: {current_gen}"
  pop_size = f"Population Size: {len(pop)}"
  avg_f = f"Average Fitness: {sum(pop_f) / len(pop_f):>.3f}"
  best_f = f"Highest Fitness: {fitness_f(max(pop))}"

  chunks = [gen, pop_size, avg_f, best_f]

  if mutations is not None:
    chunks.append(f"Total Mutations: {mutations}")

  print(" | ".join(chunks))  
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

# Roulette wheel function for random selection
def Roulette_wheel(pop, pop_f):
  global cumulative_f
  parents = []

  # Normalise the fitness values range by calculating {Fitness / total_f}
  normalised = [x/ sum(pop_f) for x in pop_f]

  # print('normalised fitness')
  # print('__________________')
  # print_f(normalised)
  # print('__________________')

  # Creates a new list of cumulative fitness values for use
  accumulate(normalised)
  
  # print('cumulative fitness') 
  # print('__________________') 
  # print_f(cumulative_f) 
  # print('__________________')

  # Appends chromosomes that beat the fitness threshold to a list of successful parents, higher fitness individuals are more likely to appear repeatedly
  for index2 in range(len(pop)):
    rand_n = rand.uniform(0, 1)
    individual_n = 0

    for fitvalue in cumulative_f:
      if(rand_n <= fitvalue):
        parents.append(pop[individual_n])
        break
      individual_n += 1
  return parents

def accumulate(normalised):
  # Creates a new list of cumulative fitness values for use
  global cumulative_f
  cumulative_f = []
  cumsum = 0

  for f in normalised:
    cumsum += f 
    cumulative_f.append(cumsum)

  return cumulative_f

# Function to handle crossovers of chromosomes
def mating_crossover(parent_a, parent_b):
  offspring = []
  # decides a random cut point in the chromosome, anywhere between the second and last index of parent_a
  cut_point = rand.randint(1, len(parent_a) -1)

  # adds beginning of A and end of B together and vice versa, using {cut_point} as the divider
  offspring.append(parent_a[:cut_point] + parent_b[cut_point:])
  offspring.append(parent_b[:cut_point] + parent_a[cut_point:])

  for chromo in offspring:
    chromo = mutate(chromo)

  return offspring

# Function to handle mutations
def mutate(chromo):
  global mutations_t
  for idx in range(len(chromo)):
    if rand.random() < 0.05:
      chromo = chromo[:idx] + [1-chromo[idx]] + chromo[idx + 1:]
      mutations_t += 1
  return chromo

# List printer function for readability
def print_f(population_f):
  for idx in population_f:
    print(idx)

main()
#!/usr/bin/r

# Copyright (c)
cat(x)

# Copyright (c)
x <- "Double quotes ' delimitate R\'s strings."

# the following is the same as the above function
# function to print copyright notice
print_copyright <- function() {
  cat(x)
}

# call the function
print_copyright()


# Example of using a function with arguments
# function to calculate factorial
factorial <- function(n) {
  if (n == 0) {
    return(1)
  } else {
    return(n * factorial(n - 1))
  }
}

# call the function with an argument
factorial(5)


# Example of using a function with default arguments
# function to calculate the sum of two numbers
sum_numbers <- function(a = 0, b = 0) {
  return(a + b)
}

# call the function with default arguments
sum_numbers()

# call the function with different arguments
sum_numbers(5, 10)


# Example of using a function with variable number of arguments
# function to calculate the sum of any number of arguments
sum_numbers_var <- function(...) {
  return(sum(c(...)))
}

# call the function with different arguments
sum_numbers_var(1, 2, 3, 4, 5)


# Example of using a function within another function
# function to calculate the factorial of a number
factorial_inner <- function(n) {
  if (n == 0) {
    return(1)
  } else {
    return(n * factorial_inner(n - 1))
  }
}

# function to calculate the sum of the factorials of a sequence of numbers
sum_factorials <- function(start, end) {
  result <- 0
  for (i in start:end) {
    result <- result + factorial_inner(i)
  }
  return(result)
}

# call the function with different arguments
sum_factorials(1, 5)



# Example of using a function as a variable
# function to calculate the sum of two numbers
sum_numbers_func <- function(a, b) {
  return(a + b)
}

# assign the function to a variable
sum_func <- sum_numbers_func

# call the function using the variable
sum_func(5, 10)


# Example of using a function as a return value
# function to calculate the factorial of a number
factorial_outer <- function(n) {
  if (n == 0) {
    return(1)
  } else {
    return(n * factorial_outer(n - 1))
  }
}

# function to calculate the sum of the factorials of a sequence of numbers
sum_factorials_outer <- function(start, end) {
  result <- 0
  for (i in start:end) {
    result <- result + factorial_outer(i)
  }
  return(result)
}

# assign the function to a variable
sum_func_outer <- function(start, end) {
  return(sum_factorials_outer(start, end))
}

# call the function using the variable
sum_func_outer(1, 5)


# Example of using a function as a parameter to another function
# function to calculate the factorial of a number
factorial_param <- function(n) {
  if (n == 0) {
    return(1)
  } else {
    return(n * factorial_param(n - 1))
  }
}

# function to calculate the sum of the factorials of a sequence of numbers
sum_factorials_param <- function(start, end, factorial_func) {
  result <- 0
  for (i in start:end) {
    result <- result + factorial_func(i)
  }
  return(result)
}

# call the function using the factorial function as a parameter
sum_factorials_param(1, 5, factorial_param)


# Example of using a function as a closure
# function to create a closure that calculates factorials
factorial_closure <- function(n) {
  fact <- function(x) {
    if (x == 0) {
      return(1)
    } else {
      return(x * fact(x - 1))
    }
  }
  return(fact)
}


# Example of using a function as a higher-order function
# function to calculate the sum of the factorials of a sequence of numbers
sum_factorials_hof <- function(start, end, factorial_func) {
  result <- 0
  for (i in start:end) {
    result <- result + factorial_func(i)
  }
  return(result)
}

# create a closure that calculates factorials
factorial_closure_hof <- factorial_closure(5)

# call the higher-order function using the closure as a parameter
sum_factorials_hof(1, 5, factorial_closure_hof)


# Example of using a function as a higher-order function with multiple arguments
# function to calculate the sum of the factorials of a sequence of numbers
sum_factorials_hof_multi <- function(start, end, factorial_func, ...) {
  result <- 0
  for (i in start:end) {
    result <- result + factorial_func(i, ...)
  }
  return(result)
}

# create a closure that calculates factorials
factorial_closure_hof_multi <- factorial_closure(5)

# call the higher-order function using the closure as a parameter
sum_factorials_hof_multi(1, 5, factorial_closure_hof_multi, 2)


# Example of using a function as a higher-order function with variable number of arguments # nolint
# function to calculate the sum of the factorials of a sequence of numbers
sum_factorials_hof_var <- function(start, end, factorial_func, ...) {
  result <- 0
  for (i in start:end) {
    result <- result + factorial_func(i, ...)
  }
  return(result)
}


# Example of using a function as a higher-order function with default arguments
# function to calculate the sum of the factorials of a sequence of numbers
sum_factorials_hof_default <- function(start, end, factorial_func, default_arg = 0) { # nolint
  result <- 0
  for (i in start:end) {
    result <- result + factorial_func(i, default_arg)
  }
  return(result)
}


# Example of using a function as a higher-order function with multiple return values # nolint
# function to calculate the factorial and sum of the factorials of a sequence of numbers # nolint
factorial_sum_hof <- function(start, end, factorial_func) {
  result <- list()
  result$sum <- 0
  for (i in start:end) {
    result$factorial <- factorial_func(i)
    result$sum <- result$sum + result$factorial
  }
  return(result)
}

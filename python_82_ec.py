# Import necessary packages
import math
import matplotlib.pyplot as plt
import numpy as np
import scipy.integrate as si
# set a and b
a, b = 0, 300
# create the timespan
t = np.linspace(a, b, 10000)
F = 0.2239  # mu equals epsilon and F
omega = (2*math.pi)/10  # set omega as (2*pi)/T
epsilon = 1.8*math.pi
# create a  def to define functions for the second order linear equation


def vdp_driven(t, z):
    x, y = z  # set the variables of the system of ODE
    return [y, epsilon/omega * (1 - x ** 2) * y - x + epsilon*F*math.cos(omega*t)]
    # define the second order ODE as a 2  row vector


sol = si.solve_ivp(vdp_driven, [a, b], [1, 0], t_eval=t)  # package to solve Initial Value Problems for ODE
plt.grid(visible=None, which='major', axis='both', color='k', linestyle='-', linewidth=0.5)
plt.plot(sol.y[0], sol.y[1])  # plot the solutions


# Plot Details
plt.xticks(np.arange(-2.5, 2.5+1, step=0.5))
plt.yticks(np.arange(-20, 20+1, step=5))
plt.xlim(-2.5, 2.5)
plt.ylim(-20.20)
plt.title("Phase Plane Plot of a Particular Solution")
plt.xlabel("x")
plt.ylabel("dx/dt")
plt.show()  # make plot visible
t
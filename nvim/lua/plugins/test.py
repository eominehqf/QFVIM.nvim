import numpy as np
import matplotlib.pyplot as plt

a = np.array(range(10))
b = np.sin(a)

def add_matrix(a, b):
    c = a + b
    return c

c = add_matrix(a, b)

print(c)
print()

plt.figure()
plt.plot(a, b, label='a vs b')
plt.plot(a, c, label='a vs c')
plt.legend()
plt.show()


d = c
print(d)

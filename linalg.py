import numpy as np
a=np.array([[-2, 1, -2, 0],
            [-3, 0, -1, 0],
            [0, 3, -1, 0],
            [0, 1, 0, 0]])

b=np.array([-2,
            1, 
            -2,
            0])

x=np.linalg.solve(a, b)
print(x)
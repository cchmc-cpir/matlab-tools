# Optimum_Angle

Calculates the best angles to use for imaging HP gas with center-out trajectories. Optimizes along two paths - to maximize the total signal intensity of the final image, and to minimize the difference in signal intensity between adjecent radial (or spiral) arms.

## Usage

[MaximizeSignal,MinimizeSignalDiff] = Optimum_Angle(N) 

N is the number of excitations (radial/spiral arms)

Returns angles in degrees.
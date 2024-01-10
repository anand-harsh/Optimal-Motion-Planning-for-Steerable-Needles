# Project Title: Resolution Optimal Motion Planning for Steerable Needles
(Application of Deep-Learning (ML) in Robotics)

Subtopic: Health and Wellness

# Project Inspiration
Advances in medical imaging modalities such as MRI, ultrasound, and X-ray fluoroscopy are now providing physicians with real-time, patient-specific information as they perform medical procedures such as extracting tissue samples for biopsies, injecting drugs for anesthesia, or implanting radioactive seeds for brachytherapy cancer treatment. These diagnostic and therapeutic medical procedures require insertion of a needle to a specific location in soft tissue. We are developing motion planning algorithms for medical needle insertion procedures that can utilize the information obtained by real-time imaging to accurately reach desired locations. 

The steerable needle motion planning problem is to determine a sequence of actions (insertions and direction changes) so the needle tip reaches the specified target while avoiding obstacles and staying inside the workspace. Given a segmented medical image of the target, obstacles, and starting location, the feasible workspace for motion planning is defined by the soft tissues through which the needle can be steered. Obstacles represent tissues that cannot be cut by the needle, such as bone, or sensitive tissues that should not be damaged, such as nerves or arteries. 


# Central Idea 

The motion planning problem can be simulated and analyzed using two major steps
1.Obstacle Recognition 
2.Needle Path Finder  

1.Obstacle Recognition

Obstacle Recognition is achieved by programming the ROS Model under K-means Clustering method under unsupervised learning.	ROS is (Robot Operating System) 
Considering the simulation of the model we will use ‘Construct Platform’ wherein 
Step1:
The robot is configured within a 3D space with co-ordinates assigned according to the grid.(Co-ordinate size- up to 6 decimals)

![image](https://github.com/anand-harsh/devsoc23/assets/94885893/c81321b8-96c3-4b64-b7cf-ee629ee832d3)
 
 Robot used: Turtle Robot for simulation

Step2: Model Training (Needle Configuring)

When you start to perform clustering (k-mean) algorithms, the start position of the centroid in the space (2S, 3D, or another) is completely random. You run training (computation of the proper location of the centroid) for the number of iterations our model converges (normally, you stop the learning process when your model converges - the location of the centroids do not change the location or you decide prior how many times you are going to compute the new location of the centroid – the number of iterations). The number of iterations (or convergence limits that you run training) indicates the number of times you compute for the whole data set (all the points) the distance to each of the defined centroids. Each point receives the label for each centroid that it belongs to. The label is given a base on the shortest distance to the centroid (Euclidean distance). When all the points are temporarily labeled (each point belongs only to one centroid), the mean of the sum distances for each of the points belonging to the proper centroid are computed. The centroid moves to a new position (based on the computed new value of the mean sum) and the process is repeated over again. This computation process as it was mentioned above finishes while the number of iterations is exhausted or the model is converged (centroids do not move or move very little). After the process of training is terminated, you can estimate the area of each cluster. Now, new coming data immediately can be “classified” to the correct cluster (group). K-means Clustering Method used for model training 




Step 3: Data Collection and Analysis for Obstacle positioning on the grid 
![image](https://github.com/anand-harsh/devsoc23/assets/94885893/f4c3db98-820d-405b-8167-ed03305df8c4)

The robot is made to activate its laser and detect the co-ordinates of the obstacle 
The co-ordinate data is loaded to a csv file further used for the testing of the model 

Step 4: Plotting the clusters of the object positions detected by the robot
Step 5: Cluster center allocation based on the ‘centroid’ method 

Finally, the cluster centers denote the position of the obstacle in the grid 
Thus, the obstacle is detected and the robot is successfully trained.

# Application to Project 

Considering the needle path finder, the needle using the above model of obstacle recognition recognizes the all-possible obstacles which represent organs in the grid.

 ![image](https://github.com/anand-harsh/devsoc23/assets/94885893/a9d86c28-ba88-4392-aa08-98da5e2e1658)


2.Needle path finder 
 
 ![image](https://github.com/anand-harsh/devsoc23/assets/94885893/91c7c2df-4f83-4377-982c-8385940656c3)


a)	First the part of the body is scanned from where the needle is to be inserted and till the destinated particle which is to be removed
b)	Then the body is represented on the grid having the scale of 0.01mm per side of a small square to have precise surgery.
c)	Now a shortest path algorithm finds the all-possible shortest path from source to destination and store them in a priority queue in order of latest to oldest.
d)	Now we define constraint d which will be the minimum distance from the organ and needle to ensure safe surgery procedure.
e)	This constraint will be applied to all the adjacent grids of all the organs so that needle will not touch the organs.
f)	In the below representation, d is the distance between outer wall of the organ shown in brown colour and the green lines.
g)	Now, if any shortest path touches or crosses the green lines will be rejected and another path from the queue will be popped out and the constraints will be checked again, and the best shortest path will be selected.
h)	The arrow represents Needle and the triangular structure represents the target to be removed from the body


# Representation of path finder
                                                                
![image](https://github.com/anand-harsh/devsoc23/assets/94885893/78b9b32c-4060-426a-923f-f1a62d8a97a0)
![image](https://github.com/anand-harsh/devsoc23/assets/94885893/e2d514ee-c7c1-46ef-ac64-c1523d180482)


# Tech Stack Used

1.ROS (Robot Operating System) -->’Construct Simulator’
2.Python (NumPy, pandas)
3.Machine learning Libraries used: Kera’s ,K means Clustering, Seaborn, Graph Algorithms(Shortest path),dynamic programming

# Implementations of Idea

Given a medical image with segmented obstacles, target, and start region, our method formulates the planning problem as a Markov Decision Process (MDP) based on an efficient discretization of the state space, models motion uncertainty using probability distributions, and computes actions to maximize the probability of success using infinite horizon DP. Using our implementation of the method, we generated motion plans for steerable needles to reach targets inaccessible to stiff needles and illustrated the importance of considering uncertainty in needle motion 

# TAM-VIT




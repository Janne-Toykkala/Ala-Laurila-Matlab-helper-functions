# Ala-Laurila-Matlab-helper-functions
Ala-Laurila lab's Matlab helper functions and how to use them. Helper functions written by Johan Westö, documentation by Janne Töykkälä

## First things first
1. Download Git and Ghostscript through the Aalto software centre. You need these to make the helper fuctions work.

2. Then, download all the helper functions and save them to the same local directory (i.e. a folder on your computer, for example to something like \\home.org.aalto.fi\user\data\Documents\MATLAB)

## How to get *export_fig*
The purpose of this publicly available Matlab code is to make Matlab save figures you have created in a consistent and correct format. Sadly, Matlab does not do this itself properly.

1. Make a Git clone of the publicly available **export_fig** repository on GitHub. 
Save the clone to a local directory.
 
2. Download the helper function **setPaths.m** script from this current repository and open it on Matlab.

   SetPaths has two sections that include the comment *“MODIFY THIS!!!”*.

3. On line 13 of setPaths, set the path to the local directory where setPaths is located on your computer.

   It should say something like “\\home.org.aalto.fi\user\data\Documents\MATLAB\setPaths”
(you can find and copy the path from File Explorer, for example by clicking on the folder icon on the top navigation bar when you are at the directory).

4. On line 29, set the path to the directory where export_fig is located
(for example, something like “\\home.org.aalto.fi\user\data\Documents\MATLAB\export_fig”).

5. Run setPaths.m without errors.

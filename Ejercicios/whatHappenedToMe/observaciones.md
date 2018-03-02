## Tarea "Debug"
En este proyecto prueba se encontrarón varios errores que en un principio no dejaban ni siquiera compilar el proyecto. Para poder lograr que el proyecto funcionara de la manera que se cree que es la correcta se realizaron los siguientes pasos:

1. Se revisaron en un princpio los archivos ViewController.swift y Main.storyboard

2. Una vez que se revisaron ambos elementos se detecto que en el ViewController.swift había una variable para una etiqueta que no tenía la referencia @IBOutlet y que además había una función llamada actionButton que modificaba la variable de la etiqueta antes mencionada

3. Mientras tanto en el Main.storyboard se pudo observar que habían 2 botones y 2 etiquetas, de los cuales solo un botón estaba bien relacionado, ya que había una etiqueta que estaba relacionada con una variable que no existía, para esto solo se hizo la corrección de la relación de la etiqueta con la variable correcta, el botón se asoció a la función del ViewController y además se eliminó la etiqueta y el botón sobrante



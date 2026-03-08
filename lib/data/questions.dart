import '../models/question.dart';

// aquí van las preguntas
final List<Question> questions = [
  Question(
    question: "¿Cuál es el nombre completo del profesor de PDSIII?",
    answers: [
      Answer(text: "José Luis Aguilera Lozeno", isCorrect: false),
      Answer(text: "José Luis Armendariz Luzania", isCorrect: false),
      Answer(text: "José Luis Aguilera Lozania", isCorrect: false),
      Answer(text: "José Luis Aguilera Luzania", isCorrect: true),
    ],
  ),
  Question(
    question:
        "¿Qué diagrama UML modela la interacción entre los usuarios y el sistema?",
    answers: [
      Answer(text: "Diagrama de Clases", isCorrect: false),
      Answer(text: "Diagrama de Secuencia", isCorrect: false),
      Answer(text: "Diagrama de Actividad", isCorrect: false),
      Answer(text: "Diagrama de Casos de Uso", isCorrect: true),
    ],
  ),
  Question(
    question:
        "¿Qué lenguaje de programación utiliza Flutter para el desarrollo de aplicaciones?",
    answers: [
      Answer(text: "Kotlin", isCorrect: false),
      Answer(text: "Swift", isCorrect: false),
      Answer(text: "Dart", isCorrect: true),
      Answer(text: "Java", isCorrect: false),
    ],
  ),
  Question(
    question:
        '¿Qué metodología ágil se basa en iteraciones cortas llamadas "Sprints"?',
    answers: [
      Answer(text: "Cascada", isCorrect: false),
      Answer(text: "Kanban", isCorrect: false),
      Answer(text: "Programación Extrema (XP)", isCorrect: false),
      Answer(text: "Scrum", isCorrect: true),
    ],
  ),
  Question(
    question:
        "En el patrón de arquitectura MVC, ¿qué componente actúa como intermediario entre la interfaz de usuario y la lógica de negocio?",
    answers: [
      Answer(text: "El Modelo", isCorrect: false),
      Answer(text: "La Vista", isCorrect: false),
      Answer(text: "El Controlador", isCorrect: true),
      Answer(text: "El Servicio", isCorrect: false),
    ],
  ),
  Question(
    question:
        "¿Qué tipo de prueba de software evalúa un componente, clase o función individual aislado del resto del sistema?",
    answers: [
      Answer(text: "Prueba de Integración", isCorrect: false),
      Answer(text: "Prueba Unitaria", isCorrect: true),
      Answer(text: "Prueba de Sistema", isCorrect: false),
      Answer(text: "Prueba de Carga", isCorrect: false),
    ],
  ),
  Question(
    question:
        "¿Qué significa ACID en el diseño de transacciones de bases de datos relacionales?",
    answers: [
      Answer(
        text: "Atomicidad, Consistencia, Aislamiento, Durabilidad",
        isCorrect: true,
      ),
      Answer(text: "Acceso, Control, Indexación, Datos", isCorrect: false),
      Answer(
        text: "Análisis, Codificación, Integración, Despliegue",
        isCorrect: false,
      ),
      Answer(
        text: "Asíncrono, Concurrente, Iterativo, Dinámico",
        isCorrect: false,
      ),
    ],
  ),
  Question(
    question:
        "¿Qué patrón de diseño restringe la creación de una clase a una única instancia en todo el programa?",
    answers: [
      Answer(text: "Singleton", isCorrect: true),
      Answer(text: "Factory", isCorrect: false),
      Answer(text: "Observer", isCorrect: false),
      Answer(text: "Decorator", isCorrect: false),
    ],
  ),
  Question(
    question:
        "¿Qué principio de la programación orientada a objetos permite que una clase hija redefina un método heredado de su clase padre?",
    answers: [
      Answer(text: "Encapsulamiento", isCorrect: false),
      Answer(text: "Polimorfismo", isCorrect: true),
      Answer(text: "Abstracción", isCorrect: false),
      Answer(text: "Herencia múltiple", isCorrect: false),
    ],
  ),
  Question(
    question:
        '¿Qué herramienta se utiliza ampliamente en DevOps para empaquetar una aplicación y todas sus dependencias en un "contenedor"?',
    answers: [
      Answer(text: "Kubernetes", isCorrect: false),
      Answer(text: "Jenkins", isCorrect: false),
      Answer(text: "Ansible", isCorrect: false),
      Answer(text: "Docker", isCorrect: true),
    ],
  ),
  Question(
    question: '¿Qué estructura de datos sigue el principio Last In, First Out?',
    answers: [
      Answer(text: "Queue", isCorrect: false),
      Answer(text: "Tree", isCorrect: false),
      Answer(text: "Graph", isCorrect: false),
      Answer(text: "Stack", isCorrect: true),
    ],
  ),
  Question(
    question:
        '¿Qué formato de intercambio de datos es el más utilizado en las APIs RESTful?',
    answers: [
      Answer(text: "XML", isCorrect: false),
      Answer(text: "YAML", isCorrect: false),
      Answer(text: "CSV", isCorrect: false),
      Answer(text: "JSON", isCorrect: true),
    ],
  ),
  Question(
    question:
        'En Git, ¿qué comando guarda temporalmente los cambios no confirmados para limpiar el directorio de trabajo sin perder el progreso?',
    answers: [
      Answer(text: "git stash", isCorrect: true),
      Answer(text: "git drop", isCorrect: false),
      Answer(text: "git clean", isCorrect: false),
      Answer(text: "git reset", isCorrect: false),
    ],
  ),
  Question(
    question:
        'Según la notación Big O, ¿cuál es la complejidad de tiempo en el peor de los casos del algoritmo de búsqueda binaria?',
    answers: [
      Answer(text: "O(1)", isCorrect: false),
      Answer(text: "O(n)", isCorrect: false),
      Answer(text: "O(n^2)", isCorrect: false),
      Answer(text: "O(log n)", isCorrect: true),
    ],
  ),
  Question(
    question:
        'En Dart, ¿qué símbolo se utiliza en la declaración de un tipo de dato para indicar que la variable puede contener un valor nulo?',
    answers: [
      Answer(text: "!", isCorrect: false),
      Answer(text: "?", isCorrect: true),
      Answer(text: "*", isCorrect: false),
      Answer(text: "_", isCorrect: false),
    ],
  ),
  Question(
    question:
        '¿Qué significan las siglas CI/CD en las prácticas modernas de ingeniería de software y DevOps?',
    answers: [
      Answer(
        text: "Control Interno / Desarrollo Centralizado",
        isCorrect: false,
      ),
      Answer(
        text: "Código Independiente / Diseño Concurrente",
        isCorrect: false,
      ),
      Answer(
        text: "Computación Inteligente / Datos Compartidos",
        isCorrect: false,
      ),
      Answer(
        text: "Integración Continua / Despliegue Continuo",
        isCorrect: true,
      ),
    ],
  ),
  Question(
    question:
        '¿Cuál es el comando de Git utilizado para crear una nueva rama local e inmediatamente cambiar a ella?',
    answers: [
      Answer(text: "git branch -new", isCorrect: false),
      Answer(text: "git checkout -b", isCorrect: true),
      Answer(text: "git create-branch", isCorrect: false),
      Answer(text: "git merge -n", isCorrect: false),
    ],
  ),
  Question(
    question:
        'En los principios SOLID de diseño orientado a objetos, ¿qué significa la letra "S"?',
    answers: [
      Answer(text: "Principio de Seguridad Estricta", isCorrect: false),
      Answer(text: "Principio de Sustitución", isCorrect: false),
      Answer(text: "Principio de Segregación", isCorrect: false),
      Answer(text: "Principio de Responsabilidad Única", isCorrect: true),
    ],
  ),
  Question(
    question:
        'En bases de datos SQL, ¿qué cláusula se utiliza específicamente para filtrar los resultados después de haber aplicado una agrupación con GROUP BY?',
    answers: [
      Answer(text: "WHERE", isCorrect: false),
      Answer(text: "ORDER BY", isCorrect: false),
      Answer(text: "HAVING", isCorrect: true),
      Answer(text: "FILTER", isCorrect: false),
    ],
  ),
  Question(
    question:
        '¿Qué patrón de diseño permite a un objeto notificar a una lista de "subscriptores" automáticamente cuando su estado interno cambia?',
    answers: [
      Answer(text: "Mediator", isCorrect: false),
      Answer(text: "Visitor", isCorrect: false),
      Answer(text: "Command", isCorrect: false),
      Answer(text: "Observer", isCorrect: true),
    ],
  ),
  Question(
    question:
        '¿Qué protocolo de red de la capa de transporte garantiza la entrega ordenada, verificada y sin pérdida de un flujo de datos?',
    answers: [
      Answer(text: "UDP", isCorrect: false),
      Answer(text: "IP", isCorrect: false),
      Answer(text: "ICMP", isCorrect: false),
      Answer(text: "TCP", isCorrect: true),
    ],
  ),
];

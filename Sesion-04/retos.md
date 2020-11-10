## Respuestas a retos de la sesión 4.
Ricardo Iván Macias Fusco.
maciasfusco@gmail.com
9/nov/2020

### Reto 1: Colecciones, Documentos y Proyecciones.

Utilizando la base de datos de mflix, realiza las siguientes consultas:

1. Fecha, nombre y texto de cada comentario.
```json
{
  project: {
    date: 1,
    name: 1,
    text: 1
  }
}
```

2. Título, elenco y año de cada película.
```json
{
  project: {
    title: 1,
    cast: 1,
    year: 1
  }
}
```

3. Nombre y contraseña de cada usuario.
```json
{
  project: {
    name: 1,
    password: 1
  }
}
```


## Reto 2: Filtros Básicos.

Utilizando la base de datos de mflix, realiza las siguientes consultas:

1. ¿Qué comentarios ha hecho Greg Powell?
```json
{
  project: {
    name: "Greg Powell"
  }
}
```

2. ¿Qué comentarios han hecho Greg Powell o Mercedes Tyler?
```json
{
  project: {
    $or: [
      {
        name: 'Greg Powell'
      },
      {
        name: 'Mercedes Tyler'
      }
    ]
  }
}
```

3. ¿Cuál es el máximo número de comentarios en una película?
```json
{
  project: {
    num_mflix_comments: 1
  },
  sort: {
    num_mflix_comments: -1
  },
  limit: 1
}
```

4. ¿Cuál es título de las cinco películas más comentadas?
```json
{
  project: {
   title: 1
  },
  sort: {
   num_mflix_comments: -1
  },
  limit: 5
}
```


class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final double price;
  final double rating;
  final String category;
  final String imageUrl;
  bool isFavorite;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.price,
    required this.rating,
    required this.category,
    required this.imageUrl,
    this.isFavorite = false,
  });
}

// Real book data with actual cover URLs
List<Book> sampleBooks = [
  Book(
    id: '1',
    title: 'The Psychology of Money',
    author: 'Morgan Housel',
    description: 'Timeless lessons on wealth, greed, and happiness doing well with money isn\'t necessarily about what you know. It\'s about how you behave. And behavior is hard to teach, even to really smart people.',
    price: 350.0,
    rating: 4.8,
    category: 'Action', // Keep existing categories for filtering
    imageUrl: 'https://covers.openlibrary.org/b/id/10314488-L.jpg',
  ),
  Book(
    id: '2',
    title: 'Atomic Habits',
    author: 'James Clear',
    description: 'No matter your goals, Atomic Habits offers a proven framework for improving--every day. James Clear, one of the world\'s leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits.',
    price: 450.0,
    rating: 4.9,
    category: 'Action',
    imageUrl: 'https://covers.openlibrary.org/b/id/12530188-L.jpg',
  ),
  Book(
    id: '3',
    title: 'Harry Potter and the Sorcerer\'s Stone',
    author: 'J.K. Rowling',
    description: 'Harry Potter has never played a sport while flying on a broomstick. He\'s never worn a cloak of invisibility, befriended a giant, or helped hatch a dragon. All Harry knows is a miserable life with the Dursleys.',
    price: 400.0,
    rating: 4.9,
    category: 'Fiction',
    imageUrl: 'https://covers.openlibrary.org/b/id/10521270-L.jpg',
    isFavorite: true,
  ),
  Book(
    id: '4',
    title: 'The Alchemist',
    author: 'Paulo Coelho',
    description: 'Paulo Coelho\'s masterpiece tells the mystical story of Santiago, an Andalusian shepherd boy who yearns to travel in search of a worldly treasure.',
    price: 250.0,
    rating: 4.7,
    category: 'Story',
    imageUrl: 'https://covers.openlibrary.org/b/id/8259441-L.jpg',
  ),
  Book(
    id: '5',
    title: 'Sapiens: A Brief History of Humankind',
    author: 'Yuval Noah Harari',
    description: 'Earth is 4.5 billion years old. In just a fraction of that time, one species among countless others has conquered it: us. In this bold and provocative book, Yuval Noah Harari explores who we are.',
    price: 550.0,
    rating: 4.8,
    category: 'Story',
    imageUrl: 'https://covers.openlibrary.org/b/id/8408013-L.jpg',
  ),
  Book(
    id: '6',
    title: '1984',
    author: 'George Orwell',
    description: 'Among the seminal texts of the 20th century, Nineteen Eighty-Four is a rare work that grows more haunting as its futuristic purgatory becomes more real.',
    price: 200.0,
    rating: 4.6,
    category: 'Fiction',
    imageUrl: 'https://covers.openlibrary.org/b/id/12604245-L.jpg',
  ),
  Book(
    id: '7',
    title: 'Dune',
    author: 'Frank Herbert',
    description: 'Set on the desert planet Arrakis, Dune is the story of the boy Paul Atreides, heir to a noble family tasked with ruling an inhospitable world where the only thing of value is the \'spice\' melange.',
    price: 420.0,
    rating: 4.8,
    category: 'Fiction',
    imageUrl: 'https://covers.openlibrary.org/b/id/10565860-L.jpg',
  ),
  Book(
    id: '8',
    title: 'Project Hail Mary',
    author: 'Andy Weir',
    description: 'Ryland Grace is the sole survivor on a desperate, last-chance mission—and if he fails, humanity and the earth itself will perish.',
    price: 480.0,
    rating: 4.9,
    category: 'Action',
    imageUrl: 'https://covers.openlibrary.org/b/id/11520692-L.jpg',
    isFavorite: true,
  ),
  Book(
    id: '9',
    title: 'The Midnight Library',
    author: 'Matt Haig',
    description: 'Between life and death there is a library, and within that library, the shelves go on forever. Every book provides a chance to try another life you could have lived.',
    price: 320.0,
    rating: 4.5,
    category: 'Story',
    imageUrl: 'https://covers.openlibrary.org/b/id/10609355-L.jpg',
  ),
  Book(
    id: '10',
    title: 'Daring Greatly',
    author: 'Brené Brown',
    description: 'Every day we experience the uncertainty, risks, and emotional exposure that define what it means to be vulnerable or to dare greatly.',
    price: 300.0,
    rating: 4.7,
    category: 'Action',
    imageUrl: 'https://covers.openlibrary.org/b/id/8254249-L.jpg',
  ),
];

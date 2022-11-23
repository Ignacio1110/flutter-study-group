void main() {
  // Dog dog = Dog("dog", 3);
  // dog.onEat();
  // dog.isBeingBulled();
  //
  // Cat cat = Cat("cat", 9);
  // cat.onEat();

  //10貓 10狗 餵食
  List<Dog> dogs = List.generate(10, (index) => Dog(index, "dog$index", 4));
  List<Cat> cats = List.generate(10, (index) => Cat(index, "cat$index", 4));
  List<Animal> animals = List.generate(
      200,
      (index) => index % 2 == 0
          ? Dog(index, "dog$index", 4)
          : Cat(index, "cat$index", 4));

  for (Dog dog in dogs) {
    dog.onEat();
  }

  for (Cat cat in cats) {
    cat.onEat();
  }

  for (Animal animal in animals) {
    animal.onEat();
    if (animal is Dog) {
      animal.isBeingBulled();
    } else if (animal is Cat) {
      animal.onEat();
    }
  }
}

//運行時： 實例 instance
//類別 class 物件Object
class Dog extends Animal {
  String? name;
  int legs = 4;
  int id;

  Dog(this.id, String inputName, int inputLegs) {
    name = inputName;
    legs = inputLegs;
  }

  @override
  onEat() {
    print("dog is eating");
  }

  isBeingBulled() {
    legs--;
    print("我少一條腿： 剩$legs");
  }
}

class Cat extends Animal {
  String? name;
  int legs = 4;
  int id;

  Cat(this.id, this.name, this.legs);

  @override
  onEat() {
    print("cat is eating");
  }
}

abstract class Animal {
  onEat();
}

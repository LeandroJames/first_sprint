export class Middleware {
  some_class;
  constructor(myClass) {
    this.some_class = myClass;
  };
  square(number) {
    return number ** 2;
  };
  cube(number) {
    return number ** 3;
  };
  half(number) {
    return number / 2;
  };
};
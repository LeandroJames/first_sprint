export class Middleware {
  constructor(myClass) {
    myClass extends this;
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
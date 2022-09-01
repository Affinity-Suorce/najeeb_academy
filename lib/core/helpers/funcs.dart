String indexFunction(int index) =>
    index <= 9 ? "0$index".toString() : index.toString();

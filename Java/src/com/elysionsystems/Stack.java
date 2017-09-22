package com.elysionsystems;


public class Stack {

    private Element topElement;

    public void push(Element e){
        e.setNext(topElement);
        topElement = e;
    }
    public Element top(){
        return topElement;
    }

    public boolean pop(){
        topElement = topElement.getNext();
        return topElement == null;
    }

    public void print(){
        System.out.print("print - Stack ");
        if (isEmpty()){
            System.out.println("is empty");
        }
        else {
            System.out.print("contains: ");
            Element tempElement = topElement;
            while (tempElement != null) {
                System.out.print(tempElement.getValue() + ", ");
                tempElement = tempElement.getNext();
            }
            System.out.println("top Element = " + topElement.getValue());
        }
    }

    public boolean isEmpty(){
        return topElement == null;
    }

    public int size(){
        if(isEmpty()){
            return 0;
        }
        else {
            int size = 1;
            Element tempElement = topElement;
            while (tempElement.getNext() != null) {
                tempElement = tempElement.getNext();
                size++;
            }
            return size;
        }
    }
}

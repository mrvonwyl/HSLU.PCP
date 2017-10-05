package com.elysionsystems;


public class Stack {

    private Element topElement;
    private int size = 0;

    public void push(Element e){
        e.setNext(topElement);
        topElement = e;
        size++;
    }
    public Element top(){
        return topElement;
    }

    public boolean pop(){
        if (topElement!= null) {
            topElement = topElement.getNext();
            size--;
        }
        return topElement == null;
    }

    public void print(){
        System.out.print("print - Stack ");
        if (isEmpty()){
            System.out.println("is empty");
        }
        else {
            System.out.println("contains: " + topElement.toString() + ", top element: " + topElement.getValue());
        }
    }

    public boolean isEmpty(){
        return topElement == null;
    }

    public int size(){
        return size;
    }
}

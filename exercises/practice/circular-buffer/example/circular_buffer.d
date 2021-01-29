module circular;

import std.stdio;
import std.string;

class Buffer(ElementType)
{
public:
    this(size_t capacity)
    {
        container.length = capacity;
        unread = 0;
        readIndex = 0;
        writeIndex = 0;
        this.capacity = capacity;
    }

    ElementType pop()
    {
        if (empty())
        {
            throw new Exception(format("Popped empty buffer!"));
        }

        ElementType last = container[readIndex];
        readIndex = (readIndex + 1) % capacity;
        --unread;

        return last;
    }

    void push(ElementType element)
    {
        if (full())
        {
            throw new Exception(format("Pushed into full buffer!"));
        }

        container[writeIndex] = element;
        writeIndex = (writeIndex + 1) % capacity;
        ++unread;
    }

    void clear()
    {
        unread = 0;
        readIndex = 0;
        writeIndex = 0;
    }

    void forcePush(ElementType element)
    {
        if (this.full())
        {
            container[readIndex] = element;
            readIndex = advanceIndex(readIndex);
            writeIndex = readIndex;
        }
        else
        {
            push(element);
        }
    }

    bool empty()
    {
        return unread == 0;
    }

    bool full()
    {
        return unread == capacity;
    }

private:
    size_t advanceIndex(size_t index)
    {
        return (index + 1) % capacity;
    }

    ElementType[] container;
    int unread;
    size_t readIndex;
    size_t writeIndex;
    const size_t capacity;
}

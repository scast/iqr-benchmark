from itertools import chain

def generate_views(view, count):
    for i in range(1, 16):
        var = 'x{0}'.format(i)
        view = view.replace(var.upper(),var)
    view =  view.strip() + '.\n'
    return (view.format(i) for i in range(count))

def main():
    with open('views', 'r') as f:
        views = f.readlines()
    for i in xrange(10):
        m = 2**i
        new_views = chain()
        for view in views:
            new_views = chain(generate_views(view, m), new_views)

        with open('views-{0}'.format(m), 'w') as f:
            f.write(''.join(new_views))

if __name__ == '__main__':
    main()

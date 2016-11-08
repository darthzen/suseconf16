import tornado.ioloop
import tornado.web


class MainHandler(tornado.web.RequestHandler):
    def post(self):
        try:
            color = self.get_argument("color")
            message = self.get_argument("message")

            return self.write({"success": "True"})
        except:
            return self.write({"success": "False"})


def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
    ])

if __name__ == "__main__":
    app = make_app()
    app.listen(8888)
    tornado.ioloop.IOLoop.current().start()

import tornado.ioloop
import tornado.web
import RPi.GPIO as GPIO


class MainHandler(tornado.web.RequestHandler):
    def post(self):
        try:
            color = self.get_argument("color")
            message = self.get_argument("message")

            GPIO.setmode(GPIO.BOARD)
            GPIO.setup(11, GPIO.OUT)
            GPIO.setup(13, GPIO.OUT)
            GPIO.setup(15, GPIO.OUT)

            GPIO.output(11, 1)
            GPIO.output(13, 1)
            GPIO.output(15, 1)
            if color == 'blue':
                intcolor('110')

            if color == 'red':
                intcolor('101')

            if color == 'green':
                intcolor('011')

            if color == 'clear':
                intcolor('111')

            GPIO.output(11, int(intcolor[0]))
            GPIO.output(13, int(intcolor[1]))
            GPIO.output(15, int(intcolor[2]))

            engine = pyttsx.init()
            engine.setProperty('rate', 150)
            engine.setProperty('volume', 8)
            engine.say(msg)
            engine.runAndWait()

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

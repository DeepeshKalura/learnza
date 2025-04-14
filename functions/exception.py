"""Exception classes and logic and better logic"""


class LearnzaException(Exception):
    """
    A generic exception class for Learnza application.
    This exception can wrap other exceptions and provide additional context.
    """

    def __init__(self, message="An error occurred", original_exception=None):
        self.message = message
        self.original_exception = original_exception
        super().__init__(self.message)

    def __str__(self):
        if self.original_exception:
            return f"{self.message} - Original error: {str(self.original_exception)}"
        return self.message

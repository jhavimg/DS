from abc import ABC, abstractmethod

class Prototype(ABC):
    @abstractmethod
    def Clone(self):
        pass
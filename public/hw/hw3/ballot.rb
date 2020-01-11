class Person
    # Feel free to add any new
    def initialize() # Please don't add any parameters here
       # Add some codes here for the constructor of your class
    end

    def register(sid, name, vote) # Please don't add any parameters here
      # Add some codes here
      # registers a student with the corresponding SID (a string), the name (a string),
      # and vote (a list of the senators' names the student is voting for)
    end

    def count() # Please don't add any parameters here
      # Add some codes here
      # returns the total number of students who have voted so far
    end

    def update_vote(sid, vote) # Please don't add any parameters here
      # Add some codes here
      # allows a student to update the list of voted senators
      # If the student has not registered yet, this method won't do anything
    end

    def tally(name)
      # Add some codes here
      # returns the total number of votes so far for a particular candidate "name"
    end
end

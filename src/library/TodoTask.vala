/* Copyright 2016 Go For It! developers
*
* This file is part of Go For It!.
*
* Go For It! is free software: you can redistribute it
* and/or modify it under the terms of version 3 of the 
* GNU General Public License as published by the Free Software Foundation.
*
* Go For It! is distributed in the hope that it will be
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
* Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with Go For It!. If not, see http://www.gnu.org/licenses/.
*/

namespace GOFI {
    
    /**
     * A class for passing common task information.
     */
    public class TodoTask : Object {
        
        private string _title;
        private bool _done;
        private int64 _time_spent;
        
        private bool title_set;
        
        /**
         * The title of this task.
         */
        public string title {
            public set {
                _title = value;
                title_set = true;
                title_changed (_title);
            }
            public get {
                return _title;
            }
        }
        
        /**
         * Whether or not this task still needs to be completed.
         */
        public bool done {
            public set {
                _done = value;
                status_changed (value);
            }
            public get {
                return _done;
            }
        }
        
        /**
         * The amount of time spent working on this task.
         */
        public int64 time_spent {
            public set {
                _time_spent = value;
                changed ();
            }
            public get {
                return _time_spent;
            }
        }
        
        /**
         * The changed signal is emitted when a property of this changed.
         */
        public virtual signal void changed () {
            
        }
        
        /**
         * The status_changed signal is emitted when the value of done is 
         * changed.
         * @param done whether or not this task is completed
         */
        public virtual signal void status_changed (bool done) {
            changed ();
        }
        
        /**
         * The status_changed signal is emitted when the value of done is 
         * changed.
         * @param new_title the new title of the task
         */
        public virtual signal void title_changed (string new_title) {
            changed ();
        }
        
        /**
         * Creates an empty TodoTask
         */
        public TodoTask () {
            title_set = false;
            _title = "Undefined";
            _done = false;
            _time_spent = 0;
        }
        
        /**
         * Returns true if the TodoTask has all neccesary properties and fields 
         * set.
         * @return true if the TodoTask is valid
         */
        public virtual bool is_valid () {
            return (title_set);
        }
    }
}

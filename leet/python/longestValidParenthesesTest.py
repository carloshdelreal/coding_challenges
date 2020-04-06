# -*- coding: utf-8 -*-
"""
Created on Sun Apr  5 19:15:34 2020

@author: USER
"""

from longestValidParentheses import Solution
import unittest

class TestLongest(unittest.TestCase):
    def test_string1(self):
        s = Solution()
        result = s.longestValidParentheses(")(((((()())()()))()(()))(")
        self.assertEqual(result, 22, "should be 22")

    def test_validSubstring(self):
        s = Solution()
        result = s.validSubstrLength("(()")
        self.assertEqual(result, 0, "should be 0")
        result = s.validSubstrLength("())")
        self.assertEqual(result, 2, "should be 2")
        result = s.validSubstrLength(")(((((()())()()))()(()))(")
        self.assertEqual(result, 0, "should be 0")
        result = s.validSubstrLength("(((((()())()()))()(()))(")
        self.assertEqual(result, 0, "should be 0")
        result = s.validSubstrLength("((((()())()()))()(()))(")
        self.assertEqual(result, 22, "should be 22")
        
if __name__ == '__main__':
    unittest.main()
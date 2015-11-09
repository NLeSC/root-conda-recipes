import unittest

import numpy as np


class TestRoot(unittest.TestCase):
    """Test to see if python can use pyROOT
    """

    def test_root_browser(self):
        import ROOT
        b = ROOT.TBrowser()
        self.assertIsNotNone(b)

    def test_root_write(self):
        import ROOT
        file_out = ROOT.TFile("test_tree.root", "recreate")
        t = ROOT.TTree("name_of_tree", "tree title")

        # create 1 dimensional float arrays (python's float datatype corresponds to c++ doubles)
        # as fill variables
        p = np.zeros(1, dtype=float)
        e = np.zeros(1, dtype=float)

        # create the branches and assign the fill-variables to them
        t.Branch('branch0', p, 'branch0/D')
        t.Branch('branch1', e, 'branch1/D')

        # create some numbers, fill them into the fill varibles and call Fill()
        for i in range(10):
            p[0] = i * 3.141592
            e[0] = i * 2.718281
            t.Fill()

        # write the tree into the output file and close the file
        file_out.Write()
        file_out.Close()

        # Now reopen the file and check its contents
        file_in = ROOT.TFile.Open("test_tree.root")

        # Print the objects contained in the file
        file_in.ls()

        tree = file_in.Get("name_of_tree")

        # Print the contents of the tree
        tree.Print()

        # Print all values
        tree.Scan("*")

        # Get the branches
        p = tree.GetBranch("branch0")
        e = tree.GetBranch("branch1")

        # Check number of events in branches
        self.assertEqual(p.GetEntries(), 10)
        self.assertEqual(e.GetEntries(), 10)

        # Get event 0
        tree.GetEntry(0)

        # Check values
        self.assertEqual(tree.branch0, 0.)
        self.assertEqual(tree.branch1, 0.)

        # Get event 1
        tree.GetEntry(1)

        # Check values
        self.assertEqual(tree.branch0, 3.141592)
        self.assertEqual(tree.branch1, 2.718281)

        file_in.Close()

if __name__ == '__main__':
    unittest.main()

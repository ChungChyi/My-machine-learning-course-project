import unittest
from math_demo import my_math
#import requests
def setUpModule():
    #模块级别前置条件，函数名固定，unittest会自动识别，主要用于文件打开和关闭
    print('Module-level preconditions run')
def tearDownModule():
    print('Module-level postconditions run')


class test_my_math(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        print('Class-level preconditions run')
    @classmethod
    def tearDownClass(cls):
        print('Class-level postconditions run')
    def setUp(self):
        print('preconditions run')
        self.math = my_math(7,8)
        self.math2 = my_math(7,0)
    def tearDown(self):
        print('postconditions run')
        self.math = None
        self.math2 = None
    def test_add(self):
        num_add = self.math.SumTwoNums()
        print('7 + 8 =:',num_add)
        self.assertEqual(num_add,15)
        # self.assertEqual([case1.SumTwoNums(),case2.SumTwoNums()],[15,150])
    def test_mul(self):
        num_mul = self.math.MulTwoNums()
        print('7 * 8 = ', num_mul)
        self.assertEqual(num_mul,56)
    def test_div(self):
        num_div_1 = self.math.DivTwoNums()
        num_div_2 = self.math2.DivTwoNums()
        print('7/8 = ',num_div_1)
        print('7/0 = ',num_div_2)
        self.assertEqual(num_div_1,7/8)
        self.assertEqual(num_div_2,'The divisor can not be zero!!!')
    def test_sub(self):
        num_sub = self.math.SubTwoNums()
        print('7-8 = ',num_sub)
        self.assertEqual(num_sub,-1)

class test_my_math2(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        print('Module-level preconditions run')
    @classmethod
    def tearDownClass(cls):
        print('Module-level postconditions run')
    def setUp(self):
        print('preconditions run')
        self.math = my_math(7,8)
        self.math2 = my_math(7,0)
    def tearDown(self):
        print('Module-level postconditions run')
        self.math = None
        self.math2 = None
    def test_add(self):
        num_add = self.math.SumTwoNums()
        print('7 + 8 =:',num_add)
        self.assertEqual(num_add,15)
        # self.assertEqual([case1.SumTwoNums(),case2.SumTwoNums()],[15,150])
    # def test_baidu(self):
    #     url = 'https://www.baidu.com'
    #     # 返回的中文是乱码，需要设置返回数据的编码格式
    #     response = requests.get(url)
    #     print('编码格式为',response.encoding,type(response))
    #     response.encoding = 'utf-8'
    #     response_data = response.text
    #     print('response_data的类型是',type(response_data))
    #     print(response_data)
    #
    #     self.assertNotIn('百度er下',response_data,'案例测试失败')

#
# if __name__ == '__main__':
#     unittest.main()
    #if you want to use unittest.main()  your test case must begin with 'test'!!!
    # suite = unittest.TestSuite()
    # suite.addTests([test_my_math('test_add'),test_my_math('test_mul'),\
    #                 test_my_math('test_div')])
    # runner = unittest.TextTestRunner()
    # runner.run(suite)

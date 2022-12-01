class AwscliAT2429 < Formula
    include Language::Python::Virtualenv
  
    desc "Official Amazon AWS command-line interface"
    homepage "https://aws.amazon.com/cli/"
    url "https://github.com/aws/aws-cli/archive/2.4.29.tar.gz"
    sha256 "d45d1ced1fe488fdff9e155bcf478fc63762688c81c42856c50fecc845dbd621"
    license "Apache-2.0"
    head "https://github.com/aws/aws-cli.git", branch: "v2"
  
    bottle do
      sha256 cellar: :any,                 arm64_monterey: "fe95451d87304b9216d52244af7bb49fdc876e9d8af997c5f952e5b540335464"
      sha256 cellar: :any,                 arm64_big_sur:  "8bbfd1eed93e48caaa4c392b9a3ec0ce5d79ab5136c661ed9cd754d9b8cc5599"
      sha256 cellar: :any,                 monterey:       "4288756d5390d107dfa0e62f5b9472bf014ba068df47c78054798b8685eed59e"
      sha256 cellar: :any,                 big_sur:        "6cc3b387b8837dbabc6164f83d4fe7af10a39c28cf75964a3f7188319788339f"
      sha256 cellar: :any,                 catalina:       "26b9eb5bd413481b9067a7f523e3dc8a32600ac27e38f7ac8fbe988ab06f8f5e"
      sha256 cellar: :any_skip_relocation, x86_64_linux:   "875fda875ff0d7d136913374cfb992ccea3b0d4230dfe795dc413d86a88a73bb"
    end
  
    depends_on "cmake" => :build
    depends_on "rust" => :build # for cryptography
    depends_on "python@3.9"
    depends_on "six"
  
    uses_from_macos "groff"
  
    # Python resources should be updated based on setup.cfg. One possible way is:
    # 1. Run `pipgrip 'awscli @ #{url}' --sort`
    # 2. Ignore `six`. Update all other PyPI packages
  
    resource "awscrt" do
      url "https://files.pythonhosted.org/packages/56/3f/4ab8b2d37abc367983a4cbd0d4fc00053af0b725698d8e936672b9cdf881/awscrt-0.13.5.tar.gz"
      sha256 "7543658cc2ac6e5e9e072844622bd681125ccd3070dcdd51565f2bddef3df268"
    end
  
    resource "cffi" do
      url "https://files.pythonhosted.org/packages/00/9e/92de7e1217ccc3d5f352ba21e52398372525765b2e0c4530e6eb2ba9282a/cffi-1.15.0.tar.gz"
      sha256 "920f0d66a896c2d99f0adbb391f990a84091179542c205fa53ce5787aff87954"
    end
  
    resource "colorama" do
      url "https://files.pythonhosted.org/packages/82/75/f2a4c0c94c85e2693c229142eb448840fba0f9230111faa889d1f541d12d/colorama-0.4.3.tar.gz"
      sha256 "e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1"
    end
  
    resource "cryptography" do
      url "https://files.pythonhosted.org/packages/10/a7/51953e73828deef2b58ba1604de9167843ee9cd4185d8aaffcb45dd1932d/cryptography-36.0.2.tar.gz"
      sha256 "70f8f4f7bb2ac9f340655cbac89d68c527af5bb4387522a8413e841e3e6628c9"
    end
  
    resource "distro" do
      url "https://files.pythonhosted.org/packages/a6/a4/75064c334d8ae433445a20816b788700db1651f21bdb0af33db2aab142fe/distro-1.5.0.tar.gz"
      sha256 "0e58756ae38fbd8fc3020d54badb8eae17c5b9dcbed388b17bb55b8a5928df92"
    end
  
    resource "docutils" do
      url "https://files.pythonhosted.org/packages/93/22/953e071b589b0b1fee420ab06a0d15e5aa0c7470eb9966d60393ce58ad61/docutils-0.15.2.tar.gz"
      sha256 "a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce2e1a99"
    end
  
    resource "jmespath" do
      url "https://files.pythonhosted.org/packages/3c/56/3f325b1eef9791759784aa5046a8f6a1aff8f7c898a2e34506771d3b99d8/jmespath-0.10.0.tar.gz"
      sha256 "b85d0567b8666149a93172712e68920734333c0ce7e89b78b3e987f71e5ed4f9"
    end
  
    resource "prompt-toolkit" do
      url "https://files.pythonhosted.org/packages/37/34/c34c376882305c5051ed7f086daf07e68563d284015839bfb74d6e61d402/prompt_toolkit-3.0.28.tar.gz"
      sha256 "9f1cd16b1e86c2968f2519d7fb31dd9d669916f515612c269d14e9ed52b51650"
    end
  
    resource "pycparser" do
      url "https://files.pythonhosted.org/packages/5e/0b/95d387f5f4433cb0f53ff7ad859bd2c6051051cebbb564f139a999ab46de/pycparser-2.21.tar.gz"
      sha256 "e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206"
    end
  
    resource "python-dateutil" do
      url "https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9/python-dateutil-2.8.2.tar.gz"
      sha256 "0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86"
    end
  
    resource "ruamel-yaml" do
      url "https://files.pythonhosted.org/packages/9a/ee/55cd64bbff971c181e2d9e1c13aba9a27fd4cd2bee545dbe90c44427c757/ruamel.yaml-0.15.100.tar.gz"
      sha256 "8e42f3067a59e819935a2926e247170ed93c8f0b2ab64526f888e026854db2e4"
    end
  
    resource "urllib3" do
      url "https://files.pythonhosted.org/packages/1b/a5/4eab74853625505725cefdf168f48661b2cd04e7843ab836f3f63abf81da/urllib3-1.26.9.tar.gz"
      sha256 "aabaf16477806a5e1dd19aa41f8c2b7950dd3c746362d7e3223dbe6de6ac448e"
    end
  
    resource "wcwidth" do
      url "https://files.pythonhosted.org/packages/25/9d/0acbed6e4a4be4fc99148f275488580968f44ddb5e69b8ceb53fc9df55a0/wcwidth-0.1.9.tar.gz"
      sha256 "ee73862862a156bf77ff92b09034fc4825dd3af9cf81bc5b360668d425f3c5f1"
    end
  
    def install
      # The `awscrt` package uses its own libcrypto.a on Linux. When building _awscrt.*.so,
      # Homebrew's default environment causes issues, which may be due to `openssl` flags.
      # This causes installation to fail while running `scripts/gen-ac-index` with error:
      # ImportError: _awscrt.cpython-39-x86_64-linux-gnu.so: undefined symbol: EVP_CIPHER_CTX_init
      # As workaround, add relative path to local libcrypto.a before openssl's so it gets picked.
      if OS.linux?
        ENV.prepend "CFLAGS", "-I./build/deps/install/include"
        ENV.prepend "LDFLAGS", "-L./build/deps/install/lib"
      end
  
      # setuptools>=60 prefers its own bundled distutils, which is incompatabile with docutils~=0.15
      # Force the previous behavior of using distutils from the stdlib
      # Remove when fixed upstream: https://github.com/aws/aws-cli/pull/6011
      with_env(SETUPTOOLS_USE_DISTUTILS: "stdlib") do
        virtualenv_install_with_resources
      end
      pkgshare.install "awscli/examples"
  
      rm Dir[bin/"{aws.cmd,aws_bash_completer,aws_zsh_completer.sh}"]
      bash_completion.install "bin/aws_bash_completer"
      zsh_completion.install "bin/aws_zsh_completer.sh"
      (zsh_completion/"_aws").write <<~EOS
        #compdef aws
        _aws () {
          local e
          e=$(dirname ${funcsourcetrace[1]%:*})/aws_zsh_completer.sh
          if [[ -f $e ]]; then source $e; fi
        }
      EOS
    end
  
    def caveats
      <<~EOS
        The "examples" directory has been installed to:
          #{HOMEBREW_PREFIX}/share/awscli/examples
      EOS
    end
  
    test do
      assert_match "topics", shell_output("#{bin}/aws help")
      assert_includes Dir[libexec/"lib/python3.9/site-packages/awscli/data/*"],
                      "#{libexec}/lib/python3.9/site-packages/awscli/data/ac.index"
    end
  end
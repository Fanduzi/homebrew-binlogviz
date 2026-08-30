cask "binlogviz" do
  version "0.23.1"

  on_macos do
    on_intel do
      sha256 "c3bf4c10b14156d522ecc04e92cf87820635117bcb8358d3b9a48202043e7e99"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.1/binlogviz_0.23.1_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "d1bd5fb05d2ab53e4052665ef6a514836f791efef31cd8d16105c2366a68424c"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.1/binlogviz_0.23.1_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "b98dab76dd2d82933e20d4bce74e0976b0ece1bc45c564457c514ac9e0d1acce"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.1/binlogviz_0.23.1_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "c7428d905b8642f96217bd3721993cf45b75f55425270b70d999b89ff2fe2161"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.1/binlogviz_0.23.1_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
